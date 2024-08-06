------------------------------------------------------------------------
This is the project README file. Here, you should describe your project.
Tell the reader (someone who does not know anything about this project)
all he/she needs to know. The comments should usually include at least:
------------------------------------------------------------------------

PROJECT TITLE: assignment 9
PURPOSE OF PROJECT: Exercise 9: Implementing the Command Pattern
Scenario: You are developing a home automation system where commands can be issued to turn devices on or off. Use the Command Pattern to achieve this.
Steps:
1.	Create a New Java Project:
o	Create a new Java project named CommandPatternExample.
2.	Define Command Interface:
o	Create an interface Command with a method execute().
3.	Implement Concrete Commands:
o	Create classes LightOnCommand, LightOffCommand that implement Command.
4.	Implement Invoker Class:
o	Create a class RemoteControl that holds a reference to a Command and a method to execute the command.
5.	Implement Receiver Class:
o	Create a class Light with methods to turn on and off.
6.	Test the Command Implementation:
o	Create a test class to demonstrate issuing commands using the RemoteControl.

VERSION or DATE: 29.04.2024
HOW TO START THIS PROJECT:
AUTHORS: SAYAN NANDY
USER INSTRUCTIONS:
