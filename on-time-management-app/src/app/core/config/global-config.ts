import {ConfigurationParameters} from '@swagger/typescript-on-time-app-api';



export const ApiConfig: ConfigurationParameters = {
  apiKeys: {
    Authorization: ''
  }
};

export function SetBearer(token: string): void {
  ApiConfig.apiKeys['Authorization'] = 'Bearer ' + (token || '');
  localStorage.setItem('Bearer', token);
}


