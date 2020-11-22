within WalkingInWorldOfThermoFluid.Easy;

model HotWaterSplySys_ex01
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {170, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pump_N(duration = 10, height = 0, offset = 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_pumpEff(k = 0.9) annotation(
    Placement(visible = true, transformation(origin = {0, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = fluid1, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 100) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = -0.5, offset = 1.0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = fluid1, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 10, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[pipe.nNodes] annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / pipe.nNodes) annotation(
    Placement(visible = true, transformation(origin = {50, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = pipe.nNodes) annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_T_tgt(duration = 2, height = 20, offset = 30, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {150, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {120, -90}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_P_T_ctrl(k = 10e6) annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.To_degC to_degC1 annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_valve.y, valveLinear1.opening) annotation(
    Line(points = {{61, 70}, {70, 70}, {70, -2}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, temperature.port) annotation(
    Line(points = {{80, -10}, {100, -10}}, color = {0, 127, 255}));
  connect(pipe.port_b, valveLinear1.port_a) annotation(
    Line(points = {{40, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(temperature.T, to_degC1.u) annotation(
    Line(points = {{107, -20}, {120, -20}, {120, -48}}, color = {0, 0, 127}));
  connect(temperature.port, boundary1.ports[1]) annotation(
    Line(points = {{100, -10}, {160, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-110, -10}, {-80, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, pipe.port_a) annotation(
    Line(points = {{10, -10}, {20, -10}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, pipe.heatPorts) annotation(
    Line(points = {{30, -20}, {30, -20}, {30, -14}, {30, -14}}, color = {191, 0, 0}, thickness = 0.5));
  connect(replicator1.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{30, -59}, {30, -40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gain1.y, replicator1.u) annotation(
    Line(points = {{39, -90}, {30, -90}, {30, -82}}, color = {0, 0, 127}));
  connect(gain1.u, gain_P_T_ctrl.y) annotation(
    Line(points = {{62, -90}, {80, -90}, {80, -90}, {80, -90}}, color = {0, 0, 127}));
  connect(gain_P_T_ctrl.u, feedback1.y) annotation(
    Line(points = {{102, -90}, {112, -90}, {112, -90}, {110, -90}}, color = {0, 0, 127}));
  connect(to_degC1.y, feedback1.u2) annotation(
    Line(points = {{120, -71}, {120, -82}}, color = {0, 0, 127}));
  connect(feedback1.u1, ramp_T_tgt.y) annotation(
    Line(points = {{128, -90}, {134, -90}, {134, -110}, {139, -110}}, color = {0, 0, 127}));
  connect(ramp_pump_N.y, from_rpm1.u) annotation(
    Line(points = {{-99, 70}, {-96, 70}, {-96, 50}, {-93, 50}}, color = {0, 0, 127}));
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
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -120}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");
end HotWaterSplySys_ex01;
