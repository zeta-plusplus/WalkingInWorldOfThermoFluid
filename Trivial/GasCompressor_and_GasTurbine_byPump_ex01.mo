within WalkingInWorldOfThermoFluid.Trivial;

model GasCompressor_and_GasTurbine_byPump_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-130, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, -0.25, -0.50}, head_nominal = {-20000, -15000, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 10000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = -2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 100, offset = 10000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset = 5 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-170, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-170, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Real kHeadCmp=6;
  parameter Real kFlowCmp=1;
  Modelica.Fluid.Machines.Pump Cmp(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {kFlowCmp*0, kFlowCmp*0.25, kFlowCmp*0.50}, head_nominal = {kHeadCmp*20000, kHeadCmp*15000, kHeadCmp*0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 10000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation(
    Placement(visible = true, transformation(origin = {-60, -80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p =  101.325 * 1000, use_T_in = false, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {20, -110}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valve1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, dp_nominal = 200 * 1000, m_flow_nominal = 2)  annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valve2(redeclare package Medium = Modelica.Media.Air.DryAirNasa, dp_nominal = 500 * 1000, m_flow_nominal = 1.2, p_nominal = 600 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = Modelica.Media.Air.DryAirNasa,T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve2(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-30, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-82, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure pressure4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-102, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-6, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(massFlowRate1.port_b, pressure1.port) annotation(
    Line(points = {{30, -30}, {50, -30}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{0, -30}, {10, -30}}, color = {0, 127, 255}));
  connect(trb.port_a, volumeFlowRate1.port_a) annotation(
    Line(points = {{-30, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, trb.shaft) annotation(
    Line(points = {{-40, 20}, {-40, -20}}));
  connect(volumeFlowRate2.port_b, trb.port_b) annotation(
    Line(points = {{-70, -30}, {-50, -30}}, color = {0, 127, 255}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-80, 60}, {-40, 60}, {-40, 40}}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{-139, 60}, {-132, 60}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-109, 60}, {-102, 60}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-159, -10}, {-150, -10}, {-150, -22}, {-142, -22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-159, -40}, {-153, -40}, {-153, -26}, {-142, -26}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor.flange_a) annotation(
    Line(points = {{-80, 60}, {-60, 60}, {-60, -70}}));
  connect(Cmp.shaft, powerSensor.flange_b) annotation(
    Line(points = {{-60, -100}, {-60, -90}}));
  connect(pressure1.port, valve1.port_a) annotation(
    Line(points = {{50, -30}, {70, -30}}, color = {0, 127, 255}));
  connect(valve1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{90, -30}, {110, -30}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valve1.opening) annotation(
    Line(points = {{80, 0}, {80, -22}}, color = {0, 0, 127}));
  connect(valve2.port_b, boundary3.ports[1]) annotation(
    Line(points = {{90, -110}, {110, -110}}, color = {0, 127, 255}));
  connect(ramp_valve2.y, valve2.opening) annotation(
    Line(points = {{80, -90}, {80, -102}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, valve2.port_a) annotation(
    Line(points = {{30, -110}, {70, -110}}, color = {0, 127, 255}));
  connect(Cmp.port_b, pressure2.port) annotation(
    Line(points = {{-50, -110}, {-30, -110}}, color = {0, 127, 255}));
  connect(Cmp.port_a, pressure3.port) annotation(
    Line(points = {{-70, -110}, {-82, -110}}, color = {0, 127, 255}));
  connect(pressure3.port, boundary2.ports[1]) annotation(
    Line(points = {{-82, -110}, {-110, -110}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_a, pressure4.port) annotation(
    Line(points = {{-90, -30}, {-102, -30}}, color = {0, 127, 255}));
  connect(pressure4.port, boundary.ports[1]) annotation(
    Line(points = {{-102, -30}, {-120, -30}}, color = {0, 127, 255}));
  connect(pressure2.port, temperature.port) annotation(
    Line(points = {{-30, -110}, {-6, -110}}, color = {0, 127, 255}));
  connect(massFlowRate.port_a, temperature.port) annotation(
    Line(points = {{10, -110}, {-6, -110}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -200}, {140, 100}}, initialScale = 0.1), graphics = {Line(origin = {-37.4005, 56.6594}, points = {{9.0238, -5.0238}, {7.0238, 12.9762}, {-8.9762, 14.9762}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-92, 63}, extent = {{64, -1}, {112, -7}}, textString = "mechanical power"), Text(origin = {-134, -47}, extent = {{64, -1}, {144, -13}}, textString = "gas turbine by 'pump' component")}),
    __OpenModelica_commandLineOptions = "");
end GasCompressor_and_GasTurbine_byPump_ex01;
