package com.team404.appointment.repository;

import com.team404.appointment.domain.Reservation;

import java.util.Date;
import java.util.List;

public interface ReservationRepository {

    List<Reservation> getHistoryByCustomerId(long customerId);

    List<Reservation> getHistoryByCustomerIdToFromDate(long customerId, Date fromDateTime, Date toDateTime);
}
