import {Component, OnInit} from '@angular/core';
import {UserModel} from '../../core/model/user-model';
import {ActivatedRoute, Router} from '@angular/router';
import {AdminService} from '../../core/services/admin.service';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.css']
})
export class EditUserComponent implements OnInit {

  userModel: UserModel;

  constructor(private route: ActivatedRoute,
              private router: Router,
              private adminService: AdminService) {

  }

  ngOnInit() {
    this.userModel = new UserModel();
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.adminService.getUser(+id).subscribe(x => this.userModel = x);
    }
  }

  save() {
    this.adminService.createOrUpdate(this.userModel)
      .subscribe(x => this.router.navigate(['/Admin']));
  }
}
