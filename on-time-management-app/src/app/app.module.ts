import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';

import {AppComponent} from './app.component';
import {RouterModule} from '@angular/router';
import {AppRoutingModule} from './app-routing.module';

import {environment} from '../environments/environment';
import {ApiModule, BASE_PATH, Configuration, ConfigurationParameters} from '@swagger/typescript-on-time-app-api';
import {HttpClientModule} from '@angular/common/http';
import {CoreModule} from './core/core-module';
import {ApiConfig, SetBearer} from './core/config/global-config';




export function apiConfigFactory(): Configuration {

  const auth = localStorage.getItem('Bearer');
  if (auth) {
    SetBearer(auth);
  }
  return new Configuration(ApiConfig);
}


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    CoreModule,
    ApiModule.forRoot(apiConfigFactory),
    HttpClientModule,
    RouterModule,
    BrowserModule,
    AppRoutingModule,

  ],
  providers: [
    {provide: BASE_PATH, useValue: environment.API_BASE_PATH}
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
