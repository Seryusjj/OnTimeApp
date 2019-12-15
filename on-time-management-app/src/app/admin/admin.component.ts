import { Component, OnInit} from '@angular/core';
import {Router} from '@angular/router';
import {forkJoin} from 'rxjs';
import {RolesService, UserResponse, UsersService} from '@swagger/typescript-on-time-app-api';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  roles: string[];
  rolesHeader: string;
  usersHeader: string;
  users: UserResponse[];

  constructor(private userService: UsersService,
              private roleService: RolesService,
              private router: Router) {
    this.rolesHeader = 'Roles';
    this.usersHeader = 'Users';
    this.roles = [];
    this.users = [];
  }

  rolePrint(role: string): string {
    return role ? role : '';
  }

  userPrint(user: UserResponse): string {
    return user ? user.email : '';
  }

  ngOnInit() {
    forkJoin([
      this.roleService.apiV1RolesGet(),
      this.userService.apiV1UsersGet()
    ]).subscribe(data => {
      if (data[0].success) {
        this.roles = data[0].response;
      }
      if (data[1].success) {
        this.users = data[1].response;
      }
    });
  }

  deleteUser(usr: any) {

  }

  deleteRole(role: any) {

  }

  editUser(user: UserResponse) {
    this.router.navigate(['/Admin/User', user.email]);
  }

  addUser() {
    this.router.navigate(['/Admin/NewUser']);
  }
}
