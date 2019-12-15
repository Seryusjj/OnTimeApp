import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {IdentityService, UserRegistrationRequest, UsersService} from '@swagger/typescript-on-time-app-api';


@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.css']
})
export class EditUserComponent implements OnInit {

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

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.usersService.apiV1UsersEmailGet(id).subscribe(x => {
        this.userModel.email = x.email;
        this.userModel.password = '';
      });
    }
  }

  save() {
    this.identityService.apiV1IdentityRegisterPost(this.userModel).subscribe(x => {
      this.router.navigate(['Admin']);
    });

  }
}
