within WalkingInWorldOfThermoFluid.Easy;

model FuelSupplySys_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  replaceable package fluid1 = Modelica.Media.Incompressible.Examples.Glycol47;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {10, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT fuelStart(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-170, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.01, length = 0.1, nParallel = 1) annotation(
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT combChamber(redeclare package Medium = fluid1, nPorts = 4, p = 40 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {180, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pump_N(duration = 10, height = 0, offset = 10000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-170, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-140, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.0025, 0.005}, head_nominal = {20 * 100, 20 * 60, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 10000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = fluid1, dp_nominal(displayUnit = "Pa") = 10.0 * 1000, m_flow_nominal = 1.0) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = 0.1, offset = 0.5, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.01, length = 0.1, nParallel = 1) annotation(
    Placement(visible = true, transformation(origin = {80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.005, zeta = 1 / 0.6 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe HX(redeclare package Medium = fluid1, diameter = 0.05, length = 0.5, nNodes = 10, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[HX.nNodes] annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = HX.nNodes) annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / HX.nNodes) annotation(
    Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_HX_heat(duration = 10, height = 0, offset = 10 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice nzl1(redeclare package Medium = fluid1, diameter = 0.005, zeta = 1 / 0.6 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.01, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice nzl2(redeclare package Medium = fluid1, diameter = 0.005, zeta = 1 / 0.6 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice nzl3(redeclare package Medium = fluid1, diameter = 0.005, zeta = 1 / 0.6 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = fluid1, diameter = 0.01, length = 0.3) annotation(
    Placement(visible = true, transformation(origin = {80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = fluid1, diameter = 0.01, length = 0.4) annotation(
    Placement(visible = true, transformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice nzl4(redeclare package Medium = fluid1, diameter = 0.005, zeta = 1 / 0.6 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(nzl4.port_b, combChamber.ports[4]) annotation(
    Line(points = {{120, -100}, {138, -100}, {138, -10}, {170, -10}, {170, -10}}, color = {0, 127, 255}));
  connect(HX.port_b, pipe4.port_a) annotation(
    Line(points = {{20, -10}, {54, -10}, {54, -100}, {70, -100}, {70, -100}}, color = {0, 127, 255}));
  connect(pipe4.port_b, nzl4.port_a) annotation(
    Line(points = {{90, -100}, {100, -100}, {100, -100}, {100, -100}}, color = {0, 127, 255}));
  connect(nzl1.port_b, combChamber.ports[1]) annotation(
    Line(points = {{120, -10}, {170, -10}}, color = {0, 127, 255}));
  connect(nzl2.port_b, combChamber.ports[2]) annotation(
    Line(points = {{120, -40}, {128, -40}, {128, -10}, {170, -10}}, color = {0, 127, 255}));
  connect(nzl3.port_b, combChamber.ports[3]) annotation(
    Line(points = {{120, -70}, {132, -70}, {132, -10}, {170, -10}}, color = {0, 127, 255}));
  connect(pipe3.port_b, nzl3.port_a) annotation(
    Line(points = {{90, -70}, {100, -70}, {100, -70}, {100, -70}}, color = {0, 127, 255}));
  connect(ramp_HX_heat.y, gain1.u) annotation(
    Line(points = {{-29, -110}, {-22, -110}}, color = {0, 0, 127}));
  connect(gain1.y, replicator1.u) annotation(
    Line(points = {{1, -110}, {10, -110}, {10, -72}}, color = {0, 0, 127}));
  connect(HX.port_b, pipe3.port_a) annotation(
    Line(points = {{20, -10}, {58, -10}, {58, -70}, {70, -70}}, color = {0, 127, 255}));
  connect(HX.port_b, pipe2.port_a) annotation(
    Line(points = {{20, -10}, {64, -10}, {64, -40}, {70, -40}}, color = {0, 127, 255}));
  connect(pipe2.port_b, nzl2.port_a) annotation(
    Line(points = {{90, -40}, {100, -40}, {100, -40}, {100, -40}}, color = {0, 127, 255}));
  connect(pipe1.port_b, nzl1.port_a) annotation(
    Line(points = {{90, -10}, {100, -10}, {100, -10}, {100, -10}}, color = {0, 127, 255}));
  connect(HX.port_b, pipe1.port_a) annotation(
    Line(points = {{20, -10}, {70, -10}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valveLinear1.opening) annotation(
    Line(points = {{-39, 80}, {-30, 80}, {-30, -2}}, color = {0, 0, 127}));
  connect(replicator1.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{10, -49}, {10, -40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(prescribedHeatFlow1.port, HX.heatPorts) annotation(
    Line(points = {{10, -20}, {10, -14}}, color = {191, 0, 0}));
  connect(valveLinear1.port_b, HX.port_a) annotation(
    Line(points = {{-20, -10}, {0, -10}, {0, -10}, {0, -10}}, color = {0, 127, 255}));
  connect(ramp_pump_N.y, from_rpm1.u) annotation(
    Line(points = {{-159, 80}, {-152, 80}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-129, 80}, {-126, 80}, {-126, 50}, {-123, 50}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-100, 50}, {-90, 50}, {-90, 30}}));
  connect(powerSensor1.flange_b, pump1.shaft) annotation(
    Line(points = {{-90, 10}, {-90, 0}}));
  connect(fuelStart.ports[1], pump1.port_a) annotation(
    Line(points = {{-160, -10}, {-100, -10}, {-100, -10}, {-100, -10}}, color = {0, 127, 255}));
  connect(pump1.port_b, valveLinear1.port_a) annotation(
    Line(points = {{-80, -10}, {-40, -10}}, color = {0, 127, 255}));
  connect(pump1.port_b, orifice.port_a) annotation(
    Line(points = {{-80, -10}, {-46, -10}, {-46, -40}, {-60, -40}, {-60, -40}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump1.port_a) annotation(
    Line(points = {{-110, -40}, {-116, -40}, {-116, -10}, {-100, -10}, {-100, -10}}, color = {0, 127, 255}));
  connect(pipe.port_a, orifice.port_b) annotation(
    Line(points = {{-90, -40}, {-80, -40}, {-80, -40}, {-80, -40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -120}, {200, 120}})),
    __OpenModelica_commandLineOptions = "");
end FuelSupplySys_ex01;
