import { NgModule } from '@angular/core';
import {PreloadAllModules, RouterModule} from '@angular/router';

@NgModule({
  imports: [
    RouterModule.forRoot(
      [
        {
          path: '',
          redirectTo: '/Login',
          pathMatch: 'full'
        },
        {
          path: 'Login',
          loadChildren: () => import('./login/login.module').then(m => m.LoginModule)
        },
        {
          path: 'Admin',
          loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
        }
      ],
      {
        enableTracing: false,
        preloadingStrategy: PreloadAllModules
      }
    )
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
