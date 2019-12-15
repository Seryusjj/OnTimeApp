import { NgModule } from '@angular/core';
import {AdminComponent} from './admin.component';
import {RouterModule} from '@angular/router';
import { EditUserComponent } from './edit-user/edit-user.component';
import {FormsModule} from '@angular/forms';
import {CoreModule} from '../core/core-module';
import { ViewCheckinComponent } from './view-checkin/view-checkin.component';
import { RoleUserComponent } from './role-user/role-user.component';

@NgModule({
  imports: [
    RouterModule,
    FormsModule,
    RouterModule.forChild([
      {
        path: '',
        component: AdminComponent
      },
      {
        path: 'User/:id',
        component: EditUserComponent
      },
      {
        path: 'NewUser',
        component: EditUserComponent
      }
    ]),
    CoreModule
  ],
  declarations: [
    AdminComponent,
    EditUserComponent,
    ViewCheckinComponent,
    RoleUserComponent
  ],
  exports: [AdminComponent]
})
export class AdminModule {}
