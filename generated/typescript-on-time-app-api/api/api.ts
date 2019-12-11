export * from './identity.service';
import { IdentityService } from './identity.service';
export * from './roles.service';
import { RolesService } from './roles.service';
export * from './users.service';
import { UsersService } from './users.service';
export const APIS = [IdentityService, RolesService, UsersService];
