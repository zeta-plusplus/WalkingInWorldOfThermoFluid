within WalkingInWorldOfThermoFluid.Trivial;

model HydroTurbine_byPump_ex01
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 1000, nPorts = 1, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, -0.25, -0.50}, head_nominal = {-100, -70, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = -10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 1000, offset = 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-150, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 1 * 101.325 * 1000, offset = 2 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {20,-40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Feedback dh_trb annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
equation
  connect(specificEnthalpy1.h_out, dh_trb.u2) annotation(
    Line(points = {{10, -40}, {6, -40}, {6, -60}, {-52, -60}, {-52, -60}}, color = {0, 0, 127}));
  connect(specificEnthalpy.h_out, dh_trb.u1) annotation(
    Line(points = {{-52, -40}, {-60, -40}, {-60, -52}, {-60, -52}}, color = {0, 0, 127}));
  connect(volumeFlowRate2.port_b, specificEnthalpy.port) annotation(
    Line(points = {{-70, -30}, {-40, -30}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, trb.port_b) annotation(
    Line(points = {{-40, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-70, 60}, {-10, 60}, {-10, 40}}));
  connect(powerSensor1.flange_b, trb.shaft) annotation(
    Line(points = {{-10, 20}, {-10, -20}}));
  connect(trb.port_a, specificEnthalpy1.port) annotation(
    Line(points = {{0, -30}, {20, -30}, {20, -30}, {20, -30}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, volumeFlowRate1.port_a) annotation(
    Line(points = {{20, -30}, {30, -30}, {30, -30}, {30, -30}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{50, -30}, {60, -30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, pressure1.port) annotation(
    Line(points = {{80, -30}, {90, -30}}, color = {0, 127, 255}));
  connect(pressure1.port, boundary1.ports[1]) annotation(
    Line(points = {{90, -30}, {110, -30}}, color = {0, 127, 255}));
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
    Diagram(coordinateSystem(extent = {{-160, -80}, {140, 100}}, initialScale = 0.1), graphics = {Line(origin = {-34.1248, 38.8175}, points = {{9.0238, -15.0238}, {7.0238, 12.9762}, {-8.9762, 14.9762}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-140, 41}, extent = {{64, -1}, {112, -7}}, textString = "mechanical power"), Text(origin = {-116, 5}, extent = {{64, -1}, {152, -15}}, textString = "hydro turbine by 'pump' component")}),
    __OpenModelica_commandLineOptions = "");
end HydroTurbine_byPump_ex01;
