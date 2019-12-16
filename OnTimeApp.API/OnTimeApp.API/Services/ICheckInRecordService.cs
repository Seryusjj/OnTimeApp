﻿using System;
using System.Threading.Tasks;
using OnTimeApp.API.Data.Results;

namespace OnTimeApp.API.Services
{
    public interface ICheckInRecordService
    {
        Task<ResultSet<CheckInResult>> GetAllCheckInsAsync();
        
        Task<ResultSet<CheckInResult>> GetCheckInByUserEmailAsync(string email);
        
        Task<ResultSet<CheckInResult>> GetCheckInByUserEmailAndDateAsync(string email, DateTime date);
        
        Task<CheckInResult> RegisterCheckInAsync(string email, string info, DateTime utcDateTime);
        
    }
}