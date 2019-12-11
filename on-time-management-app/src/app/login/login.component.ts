import { Component, OnInit } from '@angular/core';
import {IdentityService, UserLoginRequest, UsersService} from '@swagger/typescript-on-time-app-api';
import {Router} from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginRequest: UserLoginRequest;
  token: string;

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
          this.token = x.token;
          this.userService.configuration.apiKeys['Authorization'] = 'Bearer ' + this.token;
          this.userService.apiV1UsersGetRolesEmailGet(this.loginRequest.email).subscribe(y => {
            console.log(y);
          });
        }
      });
    });

  }
}
