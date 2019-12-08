export * from './auth.service';
import { AuthService } from './auth.service';
export * from './values.service';
import { ValuesService } from './values.service';
export const APIS = [AuthService, ValuesService];
