import { NgModule } from '@angular/core';
import {RouterModule} from '@angular/router';
import {FormsModule} from '@angular/forms';
import {LoginComponent} from './login.component';

@NgModule({
  imports: [
    FormsModule,
    RouterModule.forChild([
      {
        path: '',
        component: LoginComponent
      },
    ])
  ],
  declarations: [
    LoginComponent,
  ],
  exports: [LoginComponent]
})
export class LoginModule {}
