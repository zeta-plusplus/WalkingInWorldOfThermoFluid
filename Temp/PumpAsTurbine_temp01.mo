within WalkingInWorldOfThermoFluid.Temp;

model PumpAsTurbine_temp01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 1000, nPorts = 1, p = 10 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, m_flow = -10, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {100, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {0, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = -5 * 1000, offset = -10 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {34, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = -5, offset = -10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.RelativePressure relativePressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product delta_pwrFlow annotation(
    Placement(visible = true, transformation(origin = {-6, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 0.9)  annotation(
    Placement(visible = true, transformation(origin = {-6, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(boundary1.m_flow_in, ramp_m_flow.y) annotation(
    Line(points = {{110, -2}, {110, 2}, {120, 2}}, color = {0, 0, 127}));
  connect(pressure1.port, boundary1.ports[1]) annotation(
    Line(points = {{60, -10}, {90, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-110, -10}, {-90, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, trb.port_b) annotation(
    Line(points = {{-70, -10}, {-40, -10}}, color = {0, 127, 255}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-70, 50}, {-30, 50}, {-30, 30}}));
  connect(VarBySolver.y_independent, speed1.w_ref) annotation(
    Line(points = {{-99, 50}, {-93, 50}, {-93, 50}, {-93, 50}}, color = {0, 0, 127}));
  connect(massFlowRate1.port_b, pressure1.port) annotation(
    Line(points = {{40, -10}, {60, -10}, {60, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(relativePressure1.port_b, trb.port_b) annotation(
    Line(points = {{-40, -50}, {-50, -50}, {-50, -10}, {-40, -10}, {-40, -10}}, color = {0, 127, 255}));
  connect(relativePressure1.port_a, trb.port_a) annotation(
    Line(points = {{-20, -50}, {-14, -50}, {-14, -10}, {-20, -10}, {-20, -10}}, color = {0, 127, 255}));
  connect(trb.port_a, volumeFlowRate1.port_a) annotation(
    Line(points = {{-20, -10}, {-10, -10}, {-10, -10}, {-10, -10}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, trb.shaft) annotation(
    Line(points = {{-30, 10}, {-30, 0}}));
  connect(delta_pwrFlow.y, gain1.u) annotation(
    Line(points = {{-6, -92}, {-6, -92}, {-6, -98}, {-6, -98}}, color = {0, 0, 127}));
  connect(volumeFlowRate1.V_flow, delta_pwrFlow.u1) annotation(
    Line(points = {{0, -20}, {0, -20}, {0, -68}, {0, -68}}, color = {0, 0, 127}));
  connect(relativePressure1.p_rel, delta_pwrFlow.u2) annotation(
    Line(points = {{-30, -60}, {-30, -62}, {-12, -62}, {-12, -68}}, color = {0, 0, 127}));
  connect(Constraint.u_targetValue, ramp_pwr.y) annotation(
    Line(points = {{12, 28}, {24, 28}, {24, 28}, {24, 28}}, color = {0, 0, 127}));
  connect(powerSensor1.power, Constraint.u_variable) annotation(
    Line(points = {{-18, 28}, {-12, 28}, {-12, 28}, {-12, 28}}, color = {0, 0, 127}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{10, -10}, {20, -10}, {20, -10}, {20, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -120}, {140, 100}}, initialScale = 0.1), graphics = {Text(origin = {-2, 47}, extent = {{-18, 7}, {112, -7}}, textString = "Constrain power extracted by turbine (input)"), Text(origin = {36, -41}, extent = {{-18, 7}, {84, -9}}, textString = "downstream fluid pressure is output"), Line(origin = {65, 7}, points = {{-11, 35}, {11, -41}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}), Line(origin = {-52.02, 31.02}, points = {{9.0238, -15.0238}, {7.0238, 12.9762}, {-8.9762, 14.9762}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-156, 31}, extent = {{64, -1}, {112, -7}}, textString = "mechanical power")}),
    __OpenModelica_commandLineOptions = "");
end PumpAsTurbine_temp01;
