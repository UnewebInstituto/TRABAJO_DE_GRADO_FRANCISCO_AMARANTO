import axios from 'axios';
import { Platform } from 'react-native';

/**
 * CONFIGURACIÓN DE LA IP:
 * - Si usas el emulador de Android: 10.0.2.2
 * - Si usas un dispositivo físico: Usa la IP de tu PC (ej: 192.168.1.XX)
 * - El puerto 3000 corresponde al servidor Node.js de tu proyecto.
 */
const BASE_URL = Platform.OS === 'android' ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000/api';

const apiClient = axios.create({
  baseURL: BASE_URL,
  timeout: 10000, // 10 segundos de espera
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
});

// Interceptor opcional para depuración (ayuda a ver las peticiones en la consola)
apiClient.interceptors.request.use(
  (config) => {
    console.log(`🚀 Realizando petición a: ${config.baseURL}${config.url}`);
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export default apiClient;