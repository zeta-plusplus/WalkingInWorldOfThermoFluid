within WalkingInWorldOfThermoFluid.Introductory;

model pumpingSystem_ex04
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, diameter = 0.05, length = 0.5, nParallel = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 100, offset = 100, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump pump(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_nominal = 2, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, p_b_start = 10 * system.p_start, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.RelativePressure relativePressure1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Product d_flowPwr annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain_effPump(k = 1 / 0.9) annotation(
    Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(pump.port_b, relativePressure1.port_a) annotation(
    Line(points = {{-30, 30}, {-26, 30}, {-26, -20}, {-30, -20}}, color = {0, 127, 255}));
  connect(pump.port_a, relativePressure1.port_b) annotation(
    Line(points = {{-50, 30}, {-58, 30}, {-58, -20}, {-50, -20}}, color = {0, 127, 255}));
  connect(relativePressure1.p_rel, d_flowPwr.u2) annotation(
    Line(points = {{-40, -29}, {-40, -32}, {-36, -32}, {-36, -38}}, color = {0, 0, 127}));
  connect(boundary.ports[1], pump.port_a) annotation(
    Line(points = {{-70, 30}, {-50, 30}, {-50, 30}, {-50, 30}}, color = {0, 127, 255}));
  connect(pump.port_b, volumeFlowRate1.port_a) annotation(
    Line(points = {{-30, 30}, {-20, 30}, {-20, 30}, {-20, 30}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{0, 30}, {10, 30}, {10, 30}, {10, 30}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.V_flow, d_flowPwr.u1) annotation(
    Line(points = {{-10, 19}, {-10, -30}, {-24, -30}, {-24, -38}}, color = {0, 0, 127}));
  connect(massFlowRate1.port_b, pipe.port_a) annotation(
    Line(points = {{30, 30}, {40, 30}, {40, 30}, {40, 30}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, 30}, {70, 30}}, color = {0, 127, 255}));
  connect(gain_effPump.u, d_flowPwr.y) annotation(
    Line(points = {{-30, -68}, {-30, -68}, {-30, -60}, {-30, -60}}, color = {0, 0, 127}));
  connect(ramp1.y, pump.m_flow_set) annotation(
    Line(points = {{-58, 60}, {-44, 60}, {-44, 38}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end pumpingSystem_ex04;
