package com.codegym.ss10.repositories;

import com.codegym.ss10.models.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();

    void save(Student student);

    Boolean deleteById(Long id);
    List<Student> findByName(String name);
    Student findById(long id);

    boolean updateStudent(Student student);
}
