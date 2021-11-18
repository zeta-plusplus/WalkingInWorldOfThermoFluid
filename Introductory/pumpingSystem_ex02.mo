within WalkingInWorldOfThermoFluid.Introductory;

model pumpingSystem_ex02
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, diameter = 0.05, length = 0.5, nParallel = 1) annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 1000, offset = 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), redeclare function efficiencyCharacteristic=Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal=0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.RelativePressure relativePressure1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_pumpEff(k = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {0, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product d_flowPwrOutlet annotation(
    Placement(visible = true, transformation(origin = {-24, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Product d_flowPwrInlet annotation(
    Placement(visible = true, transformation(origin = {-64, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(d_flowPwrOutlet.u1, volumeFlowRate1.V_flow) annotation(
    Line(points = {{-18, -88}, {-18, -78}, {0, -78}, {0, -22}}, color = {0, 0, 127}));
  connect(relativePressure1.port_a, pump1.port_b) annotation(
    Line(points = {{-20, -70}, {-14, -70}, {-14, -10}, {-20, -10}}, color = {0, 127, 255}));
  connect(pump1.port_a, relativePressure1.port_b) annotation(
    Line(points = {{-40, -10}, {-48, -10}, {-48, -70}, {-40, -70}}, color = {0, 127, 255}));
  connect(relativePressure1.p_rel, d_flowPwrOutlet.u2) annotation(
    Line(points = {{-30, -79}, {-30, -87}}, color = {0, 0, 127}));
  connect(relativePressure1.p_rel, d_flowPwrInlet.u1) annotation(
    Line(points = {{-30, -79}, {-30, -79}, {-30, -83}, {-58, -83}, {-58, -89}, {-58, -89}}, color = {0, 0, 127}));
  connect(volumeFlowRate2.V_flow, d_flowPwrInlet.u2) annotation(
    Line(points = {{-70, -20}, {-70, -88}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-100, -10}, {-80, -10}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{70, -10}, {80, -10}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, pipe.port_a) annotation(
    Line(points = {{40, -10}, {50, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{10, -10}, {20, -10}, {20, -10}, {20, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, pump1.port_a) annotation(
    Line(points = {{-60, -10}, {-40, -10}, {-40, -10}, {-40, -10}}, color = {0, 127, 255}));
  connect(powerSensor1.power, gain_pumpEff.u) annotation(
    Line(points = {{-18, 28}, {-12, 28}, {-12, 28}, {-12, 28}}, color = {0, 0, 127}));
  connect(pump1.port_b, volumeFlowRate1.port_a) annotation(
    Line(points = {{-20, -10}, {-10, -10}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, pump1.shaft) annotation(
    Line(points = {{-30, 10}, {-30, 0}}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-40, 50}, {-30, 50}, {-30, 30}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-69, 50}, {-63, 50}, {-63, 50}, {-63, 50}}, color = {0, 0, 127}));
  connect(ramp1.y, from_rpm1.u) annotation(
    Line(points = {{-99, 50}, {-93, 50}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-140, -120}, {120, 100}})),
  __OpenModelica_commandLineOptions = "");
end pumpingSystem_ex02;
