import axios from 'axios';

const api = axios.create({
  baseURL: process.env.REACT_APP_API_URL || "http://157.180.38.74:9002",
  headers: {
    'Content-Type': 'application/json',
  },
});

export default api; 