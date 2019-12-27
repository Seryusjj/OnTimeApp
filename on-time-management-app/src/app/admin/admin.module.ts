import { NgModule } from '@angular/core';
import {AdminComponent} from './admin.component';
import {RouterModule} from '@angular/router';
import { EditUserComponent } from './edit-user/edit-user.component';
import {FormsModule} from '@angular/forms';
import {CoreModule} from '../core/core-module';
import { ViewCheckinComponent } from './view-checkin/view-checkin.component';
import {AddUserComponent} from './add-user/edit-user.component';
import {CommonModule} from '@angular/common';

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
        component: AddUserComponent
      }
    ]),
    CoreModule,
    CommonModule
  ],
  declarations: [
    AdminComponent,
    EditUserComponent,
    AddUserComponent,
    ViewCheckinComponent
  ],
  exports: [AdminComponent]
})
export class AdminModule {}
