within WalkingInWorldOfThermoFluid.Trivial;

model PumpAsTurbine_ex04
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 1000, nPorts = 1, p = 10 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {0, -60, -100}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 2000, offset = 10000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valveOpening(duration = 10, height = -0.0, offset = 1, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {80, -50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = fluid1, dp_nominal(displayUnit = "Pa") = 10 * 1000, m_flow_nominal = 10) annotation(
    Placement(visible = true, transformation(origin = {80, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(volumeFlowRate2.port_b, trb.port_a) annotation(
    Line(points = {{-70, -10}, {-40, -10}, {-40, -10}, {-40, -10}}, color = {0, 127, 255}));
  connect(trb.port_b, volumeFlowRate1.port_a) annotation(
    Line(points = {{-20, -10}, {-10, -10}, {-10, -10}, {-10, -10}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, trb.shaft) annotation(
    Line(points = {{-30, 10}, {-30, 0}}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{-118, 50}, {-114, 50}, {-114, 50}, {-112, 50}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-88, 50}, {-82, 50}, {-82, 50}, {-82, 50}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-60, 50}, {-30, 50}, {-30, 30}}));
  connect(valveLinear1.opening, ramp_valveOpening.y) annotation(
    Line(points = {{80, -18}, {80, -18}, {80, -38}, {80, -38}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{90, -10}, {100, -10}, {100, -10}, {100, -10}}, color = {0, 127, 255}));
  connect(pressure1.port, valveLinear1.port_a) annotation(
    Line(points = {{60, -10}, {70, -10}, {70, -10}, {70, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-110, -10}, {-90, -10}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, pressure1.port) annotation(
    Line(points = {{40, -10}, {60, -10}, {60, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{10, -10}, {20, -10}, {20, -10}, {20, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -120}, {140, 100}}, initialScale = 0.1), graphics = {Line(origin = {-46.3886, 29.2416}, points = {{3.0238, -15.0238}, {1.0238, 10.9762}, {-6.9762, 12.9762}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-156, 31}, extent = {{64, -1}, {112, -7}}, textString = "mechanical power")}),
    __OpenModelica_commandLineOptions = "");
end PumpAsTurbine_ex04;
