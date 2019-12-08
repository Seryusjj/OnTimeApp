import { Component, OnInit} from '@angular/core';
import {RoleModel} from '../core/model/role-model';
import {UserModel} from '../core/model/user-model';
import {AdminService} from '../core/services/admin.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  roles: RoleModel[];
  rolesHeader: string;
  usersHeader: string;
  users: UserModel[];

  constructor(private adminService: AdminService,
              private router: Router) {
    this.rolesHeader = 'Roles';
    this.usersHeader = 'Users';
    this.roles = [];
    this.users = [];
  }

  rolePrint(role: RoleModel): string {
    return role ? role.role : '';
  }

  userPrint(user: UserModel): string {
    return user ? user.name + ', ' + user.surname + ' -> ' + user.email : '';
  }

  ngOnInit() {
    this.adminService.getRoles().subscribe(x => this.roles = x);
    this.adminService.getUsers().subscribe(x => this.users = x);
  }

  deleteUser(usr: UserModel) {
    this.adminService.removeUser(usr).subscribe(x => {
      if (x) {
        this.adminService.getUsers().subscribe(y =>  this.users = y);
      }
    });
  }

  deleteRole(role: RoleModel) {
    this.adminService.removeRole(role).subscribe(x => {
      if (x) {
        this.adminService.getRoles().subscribe(y => this.roles = y);
      }
    });
  }

  editUser(user: UserModel) {
    this.router.navigate(['/Admin/User', user.id]);
  }

  addUser() {
    this.router.navigate(['/Admin/NewUser']);
  }
}
