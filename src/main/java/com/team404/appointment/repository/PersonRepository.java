package com.team404.appointment.repository;

import com.team404.appointment.domain.Person;

import java.util.List;

public interface PersonRepository {
    Person findById(long id);

    List<Person> findAll();
}
