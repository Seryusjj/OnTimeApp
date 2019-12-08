import { TestBed } from '@angular/core/testing';

import { AdminService } from './admin.service';
import {UserModel} from '../model/user-model';
import * as _ from 'lodash';

describe('AdminService', () => {

  it('should be created', () => {
    const service: AdminService = new AdminService();
    expect(service).toBeTruthy();
  });


  it('should save add element', (done) => {
    const service: AdminService = new AdminService();
    expect(service).toBeTruthy();

    const model: UserModel = {id: -1, name: 'User5', surname: 'surname 4', email: 'brandnewusermail@swiss.com'};

    let found: UserModel;
    service.createOrUpdate(model).subscribe(x => {
      service.getUsers().subscribe(allUsers => {
        found = _.find(allUsers, i => i.email === model.email);
        expect(model.email).toEqual(found.email);
        done();
      });
    });
  });


});
