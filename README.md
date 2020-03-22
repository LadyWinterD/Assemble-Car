# Assemble-Car
![car](https://github.com/LadyWinterD/Assemble-Car/blob/master/Car.PNG)
* Level 1 : SUV, Cabrio
* Level 2 : Body, Engine, Interior Decoration, Whell
* Level 3 : Door, Hood, Engine Body, Cylinder, Seats
# Create the hierarchy 
* PartID
* SubpartID
# Elements to describe characteristics:

![elements](https://github.com/LadyWinterD/Assemble-Car/blob/master/Element.PNG)

# Create a car's bill of material 
SUV (1st level), is made of an engine (2nd level), and a body (2nd level), and the body is made of a door (3rd level) and a hood (3rd level).

![table](https://github.com/LadyWinterD/Assemble-Car/blob/master/table.PNG)

* Define construction_Plan with the fields: PartID, SubPartID, Title, Component and Level.
* Initialize the field Level to 1.
* Increase Level by 1 in every recursion step.
* Limit the number of steps to Level = 2.

![bill](https://github.com/LadyWinterD/Assemble-Car/blob/master/bill.PNG)

# query result 
![resul](https://github.com/LadyWinterD/Assemble-Car/blob/master/billr.PNG)

# What is the total required quantity of each component to build the car until level 3 in the hierarchy?

![cost](https://github.com/LadyWinterD/Assemble-Car/blob/master/bmw.PNG)

# query result 

![cost](https://github.com/LadyWinterD/Assemble-Car/blob/master/bwmr.PNG)
