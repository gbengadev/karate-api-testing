package com.karateapitests.util;

import com.github.javafaker.Faker;

public class UtilMethods {
    private static Faker faker = new Faker();

    public static String generateAge(){
       return String.valueOf(faker.number().numberBetween(21, 60));
    }
    public static  String generateSalary(){
        return String.valueOf(faker.number().numberBetween(10000, 1000000));
    }
    public static String generateFullName(){
        return faker.name().fullName();
    }

}
