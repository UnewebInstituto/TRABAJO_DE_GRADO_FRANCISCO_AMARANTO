import React, { useState, useEffect } from 'react';
import { 
  StyleSheet, View, Text, TextInput, TouchableOpacity, 
  Alert, ActivityIndicator, ScrollView 
} from 'react-native';
import { Picker } from '@react-native-picker/picker';
import AsyncStorage from '@react-native-async-storage/async-storage';
import apiClient from '../../api/apiClient';

const RegistroIncidencia = ({ navigation }) => {
  const [areas, setAreas] = useState([]);
  const [tipos, setTipos] = useState([]);
  const [loading, setLoading] = useState(false);
  
  // Estado del formulario
  const [areaSelected, setAreaSelected] = useState('');
  const [tipoSelected, setTipoSelected] = useState('');
  const [observacion, setObservacion] = useState('');
  const [usuarioId, setUsuarioId] = useState(null);

  // 1. Cargar áreas y datos del usuario al montar el componente
  useEffect(() => {
    const cargarDatosIniciales = async () => {
      try {
        const userJson = await AsyncStorage.getItem('usuario_sesion');
        if (userJson) {
          const user = JSON.parse(userJson);
          setUsuarioId(user.id);
        }

        const resAreas = await apiClient.get('/areas');
        setAreas(resAreas.data.areas);
      } catch (error) {
        Alert.alert('Error', 'No se pudieron cargar las áreas de incidencia');
      }
    };
    cargarDatosIniciales();
  }, []);

  // 2. Cargar tipos de incidencia cuando cambie el área
  useEffect(() => {
    if (areaSelected) {
      const cargarTipos = async () => {
        try {
          const resTipos = await apiClient.get(`/tipos-incidencias?area_id=${areaSelected}`);
          setTipos(resTipos.data.tipos);
        } catch (error) {
          console.error(error);
        }
      };
      cargarTipos();
    } else {
      setTipos([]);
    }
  }, [areaSelected]);

  const handleRegistrar = async () => {
    if (!areaSelected || !tipoSelected || !observacion.trim()) {
      Alert.alert('Atención', 'Por favor complete todos los campos');
      return;
    }

    setLoading(true);
    try {
      await apiClient.post('/incidencias', {
        area_id: areaSelected,
        tipo_id: tipoSelected,
        usuario_id: usuarioId,
        observacion: observacion.trim()
      });

      Alert.alert('Éxito', 'Incidencia registrada correctamente', [
        { text: 'OK', onPress: () => setObservacion('') }
      ]);
      setAreaSelected('');
      setTipoSelected('');
    } catch (error) {
      Alert.alert('Error', 'No se pudo registrar la incidencia');
    } finally {
      setLoading(false);
    }
  };

  return (
    <ScrollView style={styles.container}>
      <Text style={styles.label}>Área de Incidencia</Text>
      <View style={styles.pickerContainer}>
        <Picker
          selectedValue={areaSelected}
          onValueChange={(itemValue) => setAreaSelected(itemValue)}
        >
          <Picker.Item label="Seleccione un área..." value="" />
          {areas.map(a => (
            <Picker.Item key={a.id} label={a.nombre} value={a.id} />
          ))}
        </Picker>
      </View>

      <Text style={styles.label}>Tipo de Incidencia</Text>
      <View style={styles.pickerContainer}>
        <Picker
          selectedValue={tipoSelected}
          onValueChange={(itemValue) => setTipoSelected(itemValue)}
          enabled={tipos.length > 0}
        >
          <Picker.Item label="Seleccione un tipo..." value="" />
          {tipos.map(t => (
            <Picker.Item key={t.id} label={t.nombre} value={t.id} />
          ))}
        </Picker>
      </View>

      <Text style={styles.label}>Observaciones</Text>
      <TextInput
        style={styles.textArea}
        placeholder="Describa lo ocurrido..."
        multiline
        numberOfLines={4}
        value={observacion}
        onChangeText={setObservacion}
      />

      <TouchableOpacity 
        style={styles.button} 
        onPress={handleRegistrar}
        disabled={loading}
      >
        {loading ? <ActivityIndicator color="#fff" /> : <Text style={styles.buttonText}>REGISTRAR INCIDENCIA</Text>}
      </TouchableOpacity>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, backgroundColor: '#fff' },
  label: { fontSize: 16, fontWeight: 'bold', marginBottom: 8, color: '#333' },
  pickerContainer: { borderWidth: 1, borderColor: '#ddd', borderRadius: 8, marginBottom: 20, backgroundColor: '#f9f9f9' },
  textArea: { borderWidth: 1, borderColor: '#ddd', borderRadius: 8, padding: 10, height: 100, textAlignVertical: 'top', marginBottom: 20, backgroundColor: '#f9f9f9' },
  button: { backgroundColor: '#2e7d32', padding: 15, borderRadius: 8, alignItems: 'center' },
  buttonText: { color: '#fff', fontWeight: 'bold', fontSize: 16 }
});

export default RegistroIncidencia;