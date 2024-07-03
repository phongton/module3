package com.codegym.ss10.services.impl;

import com.codegym.ss10.models.Student;
import com.codegym.ss10.repositories.IStudentRepository;
import com.codegym.ss10.repositories.impl.StudentRepository;
import com.codegym.ss10.services.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {

    private static IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public void save(Student student) {
        studentRepository.save(student);
    }

    @Override
    public Boolean deleteById(Long id) {
        return studentRepository.deleteById(id);
    }

    @Override
    public List<Student> findByName(String name) {
        return studentRepository.findByName(name);
    }

    @Override
    public Student findById(long id) {
        return studentRepository.findById(id);
    }

    @Override
    public boolean update(Student student) {
        return studentRepository.updateStudent(student);
    }
}
