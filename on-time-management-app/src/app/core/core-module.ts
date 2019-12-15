
import { NgModule, Optional, SkipSelf } from '@angular/core';
import { CommonModule } from '@angular/common';
import {CrudGridComponent} from './components/crud-grid/crud-grid.component';



@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [CrudGridComponent],
  exports: [CrudGridComponent]
})
export class CoreModule {
  /* make sure CoreModule is imported only by one NgModule the AppModule */
  /*constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error('CoreModule is already loaded. Import only in AppModule');
    }
  }*/
}
