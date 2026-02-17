import React, { createContext, useState, useEffect } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [usuario, setUsuario] = useState(null);
  const [cargando, setCargando] = useState(true);

  // Al iniciar la app, verificamos si hay una sesión guardada
  useEffect(() => {
    const cargarSesion = async () => {
      try {
        const sesionGuardada = await AsyncStorage.getItem('usuario_sesion');
        if (sesionGuardada) {
          setUsuario(JSON.parse(sesionGuardada));
        }
      } catch (e) {
        console.error("Error al cargar sesión:", e);
      } finally {
        setCargando(false);
      }
    };
    cargarSesion();
  }, []);

  // Función para iniciar sesión (se llama desde LoginScreen)
  const login = async (datosUsuario) => {
    setUsuario(datosUsuario);
    await AsyncStorage.setItem('usuario_sesion', JSON.stringify(datosUsuario));
  };

  // Función para cerrar sesión
  const logout = async () => {
    setUsuario(null);
    await AsyncStorage.removeItem('usuario_sesion');
  };

  return (
    <AuthContext.Provider value={{ usuario, cargando, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};