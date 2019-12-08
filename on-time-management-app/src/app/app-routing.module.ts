import { NgModule } from '@angular/core';
import {PreloadAllModules, RouterModule} from '@angular/router';

@NgModule({
  imports: [
    RouterModule.forRoot(
      [
        {
          path: '',
          redirectTo: '/Admin',
          pathMatch: 'full'
        },
        {
          path: 'Admin',
          loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
        }
      ],
      {
        enableTracing: true,
        preloadingStrategy: PreloadAllModules
      }
    )
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
