within WalkingInWorldOfThermoFluid.Temp;

model InverseConstraint_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(visible = true, transformation(origin = {26, 30}, extent = {{-20, -12}, {20, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0, offset = 2000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {22, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp11(duration = 10, height = 0, offset = 100, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp11.y, product.u2) annotation(
    Line(points = {{-19, -16}, {10, -16}}, color = {0, 0, 127}));
  connect(product.y, inverseBlockConstraints.u2) annotation(
    Line(points = {{33, -10}, {33, 30}, {9, 30}}, color = {0, 0, 127}));
  connect(ramp1.y, inverseBlockConstraints.u1) annotation(
    Line(points = {{-19, 30}, {3, 30}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y2, product.u1) annotation(
    Line(points = {{44, 30}, {42, 30}, {42, 10}, {10, 10}, {10, -4}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end InverseConstraint_ex01;
