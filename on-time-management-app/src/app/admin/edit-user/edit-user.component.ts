import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {
  CheckInRecordsService, HolidaysService,
  RolesService,
  UserAddSubordinateRequest,
  UserResponse,
  UserRoleRemoveRequest,
  UsersService
} from '@swagger/typescript-on-time-app-api';
import {UserRoleAdditionRequest} from '@swagger/typescript-on-time-app-api/model/userRoleAdditionRequest';


@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.css']
})
export class EditUserComponent implements OnInit {

  userModel: UserResponse;
  roles: string;
  allRoles: Array<string>;
  allUsers: Array<UserResponse>;
  allSubordinates: Array<UserResponse>;

  selectedRole: string;
  selectedSubordinateEmail: string;

  fromCheckIn: string;
  toCheckIn: string;

  fromHoliday: string;
  toHoliday: string;


  constructor(private route: ActivatedRoute,
              private router: Router,
              private rolesService: RolesService,
              private usersService: UsersService,
              private checkInService: CheckInRecordsService,
              private holidaysService: HolidaysService,
              private cdtRef: ChangeDetectorRef) {
    this.roles = '';
    this.selectedRole = '';
    this.allUsers = [];
    this.allRoles = [];
    this.allSubordinates = [];
    this.userModel = {
      email: '',
      userName: ''
    };

    this.selectedSubordinateEmail = '';
  }


  async init() {
    const rolesResponse = await this.rolesService.apiV1RolesGet().toPromise();
    if (rolesResponse.success) {
      this.allRoles = rolesResponse.response;
    }
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.userModel = await this.usersService.apiV1UsersEmailGet(id).toPromise();
      const roles = await this.usersService.apiV1UsersGetRolesEmailGet(this.userModel.email).toPromise();
      if (roles.success && this.userModel.success) {
        let count = 0;
        this.roles = '';
        roles.response.forEach(r => {
          if (count < roles.response.length - 1) {
            this.roles += r.roleName + ', ';
          } else {
            this.roles += r.roleName;
          }
          count++;
        });
      }

      const allUsersResponse = await this.usersService.apiV1UsersGet().toPromise();
      if (allUsersResponse.success) {
        this.allUsers = allUsersResponse.response;
      }

      const allSubordinatesResponse = await this.usersService.apiV1UsersSubordinatesEmailGet(this.userModel.email).toPromise();
      if (allSubordinatesResponse.success) {
        this.allSubordinates = allSubordinatesResponse.response;
      }
    }
  }


  ngOnInit() {
    this.init().then(r => {
      // refresh page with change detector ?¿
      this.cdtRef.detectChanges();
    });
  }

  displaySubordinate(usr: UserResponse) {
    return usr.email;
  }

  addRole() {
    const req: UserRoleAdditionRequest = {
      role: this.selectedRole,
      userEmail: this.userModel.email
    };

    this.usersService.apiV1UsersAddRolePost(req).toPromise().then(x => {
      this.init().then(r => {
        this.cdtRef.detectChanges();
      });
    });
  }

  removeRole() {
    const req: UserRoleRemoveRequest = {
      role: this.selectedRole,
      userEmail: this.userModel.email
    };

    this.usersService.apiV1UsersRemoveRolePost(req).toPromise().then(x => {
      this.init().then(r => {
        this.cdtRef.detectChanges();
      });
    });
  }

  addSubordinate() {
    const req: UserAddSubordinateRequest = {
      subordinateEmail: this.selectedSubordinateEmail,
      userEmail: this.userModel.email
    };
    this.usersService.apiV1UsersAddSubordiantePost(req).toPromise().then(x => {
      this.init().then(r => {
        this.cdtRef.detectChanges();
      });
    });
  }


  async getCheckIns() {
    const from: Date = new Date(Date.parse(this.fromCheckIn));
    const to: Date = new Date(Date.parse(this.toCheckIn));
    const res = await
      this.checkInService.apiV1CheckInRecordsEmailFromToGet(
        this.userModel.email,
        from, to).toPromise();
    if (res.success) {
      const tab = window.open('about:blank', '_blank');
      const myjson = JSON.stringify(res.response, null, 2);
      tab.document.write(res.response.length > 0 ? '<html><body><pre>' + myjson + '</pre></body></html>' : 'None');
      tab.document.close();
    }
  }

  async getHoliday() {
    const from: Date = new Date(Date.parse(this.fromHoliday));
    const to: Date = new Date(Date.parse(this.toHoliday));
    const res = await
      this.holidaysService.apiV1HolidaysEmailFromToGet(
        this.userModel.email,
        from.getUTCFullYear(),
        to.getUTCFullYear()).toPromise();
    if (res.success) {
      const tab = window.open('about:blank', '_blank');
      const myjson = JSON.stringify(res.response, null, 2);
      tab.document.write(res.response.length > 0 ? '<html><body><pre>' + myjson + '</pre></body></html>' : 'None');
      tab.document.close();
    }
  }
}
