import React, { useState } from 'react';
import { 
  StyleSheet, 
  View, 
  Text, 
  TextInput, 
  TouchableOpacity, 
  Alert, 
  ActivityIndicator,
  KeyboardAvoidingView,
  Platform,
  ScrollView
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import apiClient from '../../api/apiClient'; // Importamos tu configuración centralizada

const LoginScreen = ({ navigation }) => {
  const [cedula, setCedula] = useState('');
  const [clave, setClave] = useState('');
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    // 1. Validación básica de campos
    if (!cedula.trim() || !clave.trim()) {
      Alert.alert('Atención', 'Debe ingresar su cédula y contraseña');
      return;
    }

    setLoading(true);

    try {
      // 2. Petición usando el apiClient centralizado
      // El backend recibe la clave y hace el match con MD5
      const response = await apiClient.post('/login', {
        cedula: cedula.trim(),
        clave: clave
      });

      const { usuario } = response.data;

      // 3. Persistencia de la sesión (Importante para obtener el usuario_id después)
      await AsyncStorage.setItem('usuario_sesion', JSON.stringify(usuario));
      
      console.log('✅ Usuario autenticado:', usuario.nombres);

      // 4. Navegación al Home/Formulario (Si tienes el navegador configurado)
      // navigation.replace('Home'); 
      Alert.alert('Éxito', `Bienvenido, ${usuario.nombres}`);

    } catch (error) {
      console.error('❌ Error Login:', error);
      const mensaje = error.response?.data?.error || 'Error de conexión con el servidor';
      Alert.alert('Error', mensaje);
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView 
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
      style={styles.container}
    >
      <ScrollView contentContainerStyle={styles.scrollContainer}>
        <View style={styles.card}>
          <Text style={styles.title}>Gestión de Incidencias</Text>
          <Text style={styles.subtitle}>Ingrese sus credenciales</Text>
          
          <TextInput
            style={styles.input}
            placeholder="Cédula (Ej: V12345678)"
            value={cedula}
            onChangeText={setCedula}
            autoCapitalize="characters"
            keyboardType="default"
          />

          <TextInput
            style={styles.input}
            placeholder="Contraseña"
            value={clave}
            onChangeText={setClave}
            secureTextEntry
          />

          <TouchableOpacity 
            style={[styles.button, loading && styles.buttonDisabled]} 
            onPress={handleLogin}
            disabled={loading}
          >
            {loading ? (
              <ActivityIndicator color="#fff" />
            ) : (
              <Text style={styles.buttonText}>INICIAR SESIÓN</Text>
            )}
          </TouchableOpacity>
        </View>
      </ScrollView>
    </KeyboardAvoidingView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#eceff1',
  },
  scrollContainer: {
    flexGrow: 1,
    justifyContent: 'center',
    padding: 20,
  },
  card: {
    backgroundColor: '#fff',
    padding: 25,
    borderRadius: 15,
    elevation: 5, // Sombra en Android
    shadowColor: '#000', // Sombra en iOS
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 10,
  },
  title: {
    fontSize: 22,
    fontWeight: 'bold',
    textAlign: 'center',
    color: '#1a237e',
    marginBottom: 5,
  },
  subtitle: {
    fontSize: 14,
    textAlign: 'center',
    color: '#757575',
    marginBottom: 25,
  },
  input: {
    backgroundColor: '#f9f9f9',
    paddingHorizontal: 15,
    paddingVertical: 12,
    borderRadius: 10,
    borderWidth: 1,
    borderColor: '#e0e0e0',
    marginBottom: 15,
    fontSize: 16,
    color: '#333',
  },
  button: {
    backgroundColor: '#1a237e',
    padding: 15,
    borderRadius: 10,
    alignItems: 'center',
    marginTop: 10,
  },
  buttonDisabled: {
    backgroundColor: '#9fa8da',
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 16,
    letterSpacing: 1,
  },
});

export default LoginScreen;