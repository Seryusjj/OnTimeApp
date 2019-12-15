import { Component, OnInit } from '@angular/core';
import {ApiModule, IdentityService, UserLoginRequest, UsersService} from '@swagger/typescript-on-time-app-api';
import {Router} from '@angular/router';
import {ApiConfig, SetBearer} from '../core/config/global-config';
import * as _ from 'lodash';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginRequest: UserLoginRequest;

  constructor(private identityService: IdentityService,
              private router: Router,
              private userService: UsersService) {
    this.loginRequest = {
      email: 'admin@admin.com',
      password: 'Admin123!'
    };
  }

  ngOnInit() {

  }

  login() {
    this.identityService.apiV1IdentityInitPost().subscribe(() => {
      this.identityService.apiV1IdentityLoginPost(this.loginRequest).subscribe(x => {
        if (x.success) {
          console.log(x.token);
          SetBearer(x.token);
          this.userService.apiV1UsersGetRolesEmailGet(this.loginRequest.email).subscribe(y => {
            if (y.success) {
              const f = _.find(y.response, r => r.roleName === 'Admin');
              if (f) {
                this.router.navigate(['/Admin']);
              }
            }
          });
        }
      });
    });

  }
}
