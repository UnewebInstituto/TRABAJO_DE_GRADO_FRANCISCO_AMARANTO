import React, { useState, useEffect } from 'react';
import { View, ActivityIndicator } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import AsyncStorage from '@react-native-async-storage/async-storage';

// Importación de pantallas
import LoginScreen from '../screens/Login/LoginScreen';
import RegistroIncidencia from '../screens/Incidencias/RegistroIncidencia';

const Stack = createStackNavigator();

const AppNavigator = () => {
  const [estaCargando, setEstaCargando] = useState(true);
  const [usuarioAutenticado, setUsuarioAutenticado] = useState(false);

  useEffect(() => {
    // Verificar si existe una sesión guardada al abrir la app
    const verificarSesion = async () => {
      try {
        const sesion = await AsyncStorage.getItem('usuario_sesion');
        if (sesion !== null) {
          setUsuarioAutenticado(true);
        }
      } catch (error) {
        console.error('Error verificando sesión:', error);
      } finally {
        setEstaCargando(false);
      }
    };

    verificarSesion();
  }, []);

  if (estaCargando) {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <ActivityIndicator size="large" color="#1a237e" />
      </View>
    );
  }

  return (
    <NavigationContainer>
      <Stack.Navigator 
        initialRouteName={usuarioAutenticado ? "RegistroIncidencia" : "Login"}
        screenOptions={{
          headerStyle: { backgroundColor: '#1a237e' },
          headerTintColor: '#fff',
          headerTitleStyle: { fontWeight: 'bold' },
        }}
      >
        <Stack.Screen 
          name="Login" 
          component={LoginScreen} 
          options={{ title: 'Acceso al Sistema', headerShown: false }} 
        />
        <Stack.Screen 
          name="RegistroIncidencia" 
          component={RegistroIncidencia} 
          options={{ title: 'Reportar Incidencia' }} 
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default AppNavigator;