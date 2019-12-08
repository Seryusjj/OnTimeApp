import { NgModule } from '@angular/core';
import {AdminComponent} from './admin.component';
import {CoreModule} from '../core/core-module';
import {RouterModule} from '@angular/router';
import { EditUserComponent } from './edit-user/edit-user.component';
import {FormsModule} from '@angular/forms';

@NgModule({
  imports: [
    RouterModule,
    FormsModule,
    CoreModule,
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
    ])
  ],
  declarations: [
    AdminComponent,
    EditUserComponent
  ],
  exports: [AdminComponent]
})
export class AdminModule {}
