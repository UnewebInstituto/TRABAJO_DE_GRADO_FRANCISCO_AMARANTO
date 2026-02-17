import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Picker } from '@react-native-picker/picker';

/**
 * Componente CustomPicker
 * @param {string} label - Título que aparece sobre el selector
 * @param {string} selectedValue - El ID del item seleccionado
 * @param {function} onValueChange - Función que se ejecuta al cambiar la selección
 * @param {Array} items - Arreglo de objetos {id, nombre} a mostrar
 * @param {string} placeholder - Texto inicial (opcional)
 */
const CustomPicker = ({ label, selectedValue, onValueChange, items, placeholder, enabled = true }) => {
  return (
    <View style={styles.container}>
      {label && <Text style={styles.label}>{label}</Text>}
      <View style={[styles.pickerWrapper, !enabled && styles.disabled]}>
        <Picker
          selectedValue={selectedValue}
          onValueChange={onValueChange}
          enabled={enabled}
          dropdownIconColor="#1a237e"
        >
          <Picker.Item label={placeholder || "Seleccione una opción..."} value="" />
          {items.map((item) => (
            <Picker.Item 
              key={item.id.toString()} 
              label={item.nombre} 
              value={item.id} 
            />
          ))}
        </Picker>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 8,
    marginLeft: 4,
  },
  pickerWrapper: {
    backgroundColor: '#fff',
    borderRadius: 10,
    borderWidth: 1,
    borderColor: '#e0e0e0',
    overflow: 'hidden', // Importante para que el borde redondeado se aplique al Picker
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
  },
  disabled: {
    backgroundColor: '#f5f5f5',
    borderColor: '#eeeeee',
    opacity: 0.6,
  },
});

export default CustomPicker;