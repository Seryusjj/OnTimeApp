import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {IdentityService, UserRegistrationRequest, UsersService} from '@swagger/typescript-on-time-app-api';


@Component({
  selector: 'app-edit-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.css']
})
export class AddUserComponent implements OnInit {

  userModel: UserRegistrationRequest;


  constructor(private route: ActivatedRoute,
              private router: Router,
              private identityService: IdentityService,
              private usersService: UsersService) {
    this.userModel = {
      password: '',
      email: ''
    };
  }

  ngOnInit() {}

  save() {
    this.identityService.apiV1IdentityRegisterPost(this.userModel).subscribe(x => {
      this.router.navigate(['Admin']);
    });

  }
}
