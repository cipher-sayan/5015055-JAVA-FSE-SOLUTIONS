------------------------------------------------------------------------
This is the project README file. Here, you should describe your project.
Tell the reader (someone who does not know anything about this project)
all he/she needs to know. The comments should usually include at least:
------------------------------------------------------------------------

PROJECT TITLE: assignment 11
PURPOSE OF PROJECT:  Exercise 11: Implementing Dependency Injection
Scenario: 
You are developing a customer management application where the service class depends on a repository class. Use Dependency Injection to manage these dependencies.
Steps:
1.	Create a New Java Project:
o	Create a new Java project named DependencyInjectionExample.
2.	Define Repository Interface:
o	Create an interface CustomerRepository with methods like findCustomerById().
3.	Implement Concrete Repository:
o	Create a class CustomerRepositoryImpl that implements CustomerRepository.
4.	Define Service Class:
o	Create a class CustomerService that depends on CustomerRepository.
5.	Implement Dependency Injection:
o	Use constructor injection to inject CustomerRepository into CustomerService.
6.	Test the Dependency Injection Implementation:
o	Create a main class to demonstrate creating a CustomerService with CustomerRepositoryImpl and using it to find a customer.

VERSION or DATE: 29.04.2024
HOW TO START THIS PROJECT:
AUTHORS: SAYAN NANDY
USER INSTRUCTIONS:
