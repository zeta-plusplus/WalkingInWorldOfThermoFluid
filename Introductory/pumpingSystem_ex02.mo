within WalkingInWorldOfThermoFluid.Introductory;

model pumpingSystem_ex02
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.05, length = 0.5, nParallel = 1) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 1000, offset = 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), N_nominal = 1000, V(displayUnit = "l") = 0.01, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
equation
  connect(pump1.port_b, pipe.port_a) annotation(
    Line(points = {{20, -10}, {40, -10}, {40, -10}, {40, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pump1.port_a) annotation(
    Line(points = {{-20, -10}, {0, -10}, {0, -10}, {0, -10}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, pump1.shaft) annotation(
    Line(points = {{10, 20}, {10, 20}, {10, 0}, {10, 0}}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-10, 50}, {10, 50}, {10, 40}, {10, 40}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-38, 50}, {-32, 50}, {-32, 50}, {-32, 50}}, color = {0, 0, 127}));
  connect(ramp1.y, from_rpm1.u) annotation(
    Line(points = {{-79, 50}, {-63, 50}, {-63, 50}, {-63, 50}}, color = {0, 0, 127}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, -10}, {80, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end pumpingSystem_ex02;
