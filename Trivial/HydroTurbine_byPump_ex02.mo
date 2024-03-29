within WalkingInWorldOfThermoFluid.Trivial;

model HydroTurbine_byPump_ex02
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 1000, nPorts = 1, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, -0.25, -0.50}, head_nominal = {-100, -70, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = -10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 100, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset = 5 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, dp_nominal(displayUnit = "Pa") = 100 * 1000, m_flow_nominal = 1000)  annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = -0.5, offset = 1.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Feedback dht_trb annotation(
    Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
equation
  connect(ramp_valve.y, valveLinear1.opening) annotation(
    Line(points = {{110, -1}, {110, -22}}, color = {0, 0, 127}));
  connect(pressure1.port, valveLinear1.port_a) annotation(
    Line(points = {{80, -30}, {100, -30}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{120, -30}, {130, -30}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.h_out, dht_trb.u2) annotation(
    Line(points = {{-10, -40}, {-14, -40}, {-14, -60}, {-62, -60}}, color = {0, 0, 127}));
  connect(specificEnthalpy.h_out, dht_trb.u1) annotation(
    Line(points = {{-62, -40}, {-70, -40}, {-70, -52}}, color = {0, 0, 127}));
  connect(specificEnthalpy1.port, volumeFlowRate1.port_a) annotation(
    Line(points = {{0, -30}, {10, -30}, {10, -30}, {10, -30}}, color = {0, 127, 255}));
  connect(trb.port_a, specificEnthalpy1.port) annotation(
    Line(points = {{-20, -30}, {0, -30}, {0, -30}, {0, -30}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, trb.port_b) annotation(
    Line(points = {{-50, -30}, {-40, -30}, {-40, -30}, {-40, -30}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, specificEnthalpy.port) annotation(
    Line(points = {{-70, -30}, {-50, -30}, {-50, -30}, {-50, -30}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, trb.shaft) annotation(
    Line(points = {{-30, 20}, {-30, -20}}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-70, 60}, {-30, 60}, {-30, 40}}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{30, -30}, {40, -30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, pressure1.port) annotation(
    Line(points = {{60, -30}, {80, -30}}, color = {0, 127, 255}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{-139, 60}, {-132, 60}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-108, 60}, {-92, 60}, {-92, 60}, {-92, 60}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-139, -10}, {-130, -10}, {-130, -22}, {-122, -22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-139, -40}, {-133, -40}, {-133, -26}, {-123, -26}, {-123, -26}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-100, -30}, {-90, -30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -80}, {160, 100}}), graphics = {Line(origin = {-64.5071, 30.002}, points = {{9.0238, -15.0238}, {7.0238, 12.9762}, {-8.9762, 14.9762}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-170, 33}, extent = {{64, -1}, {112, -7}}, textString = "mechanical power"), Text(origin = {-132, 11}, extent = {{64, -1}, {148, -15}}, textString = "hydro turbine by 'pump' component")}),
    __OpenModelica_commandLineOptions = "");
end HydroTurbine_byPump_ex02;
