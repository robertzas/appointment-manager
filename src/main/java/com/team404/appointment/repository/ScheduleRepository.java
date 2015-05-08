package com.team404.appointment.repository;

import com.team404.appointment.domain.Schedule;

import java.util.List;

public interface ScheduleRepository {

    List<Schedule> findByEmployeeId(long employeeId);
}
