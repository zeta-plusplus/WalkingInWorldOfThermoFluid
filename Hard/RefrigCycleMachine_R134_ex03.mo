within WalkingInWorldOfThermoFluid.Hard;

model RefrigCycleMachine_R134_ex03
  extends Modelica.Icons.Example;
  //-------------------------
  package fluid1 = Modelica.Media.R134a.R134a_ph;
  //package fluid2 = Modelica.Media.Air.DryAirNasa;
  //-------------------------
  parameter Integer sigDigits_T = 4;
  parameter Integer sigDigits_p = 5;
  parameter Integer sigDigits_Q_flow = 5;
  parameter Integer sigDigits_m_flow = 4;
  parameter Integer sigDigits_rho = 4;
  //-------------------------
  constant Integer nArrStates = 9;
  Modelica.Units.SI.Temperature Arr_T[nArrStates];
  Modelica.Units.SI.SpecificEntropy Arr_s[nArrStates];
  /**/
  //-------------------------
  inner Modelica.Fluid.System system(p_ambient = 1e5, T_ambient = 288.15, p_start = 1e5, T_start = 288.15) annotation(
    Placement(transformation(origin = {14, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 1e6, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {84, 211}, extent = {{13, -13}, {-13, 13}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {57, 211}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {53, 169}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {51, 249}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(transformation(origin = {73, 175}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {73, 169}, extent = {{-2, -2}, {2, 2}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const1(k = 273.15) annotation(
    Placement(transformation(origin = {72, 243}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {72, 249}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 182}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 237}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 261.5}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 156}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 249}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 237}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 169}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 182}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = fluid1, use_portsData = false, V = 0.001, nPorts = 2) annotation(
    Placement(transformation(origin = {84, 278}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Vessels.ClosedVolume Vol031(redeclare package Medium = fluid1, V = 0.001, use_portsData = false, nPorts = 2) annotation(
    Placement(transformation(origin = {84, 138}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP031(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {100, 126}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {278, 298}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP021(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {100, 298}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_m_flow_Cmp010_out(significantDigits = sigDigits_m_flow) annotation(
    Placement(transformation(origin = {299, 325}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {136, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*10000, startTime = 10) annotation(
    Placement(transformation(origin = {136, 323}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {92, 344}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX020 annotation(
    Placement(transformation(origin = {115, 344}, extent = {{-4, -4}, {4, 4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {123, 371}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX020(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {144, 371}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {197, 310}, extent = {{-12, -12}, {12, 12}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor CpHX020(C = 10, T(start = 288.15)) annotation(
    Placement(transformation(origin = {157, 351}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cond_HX020(G = 10000) annotation(
    Placement(transformation(origin = {173, 344}, extent = {{-5, 5}, {5, -5}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP011(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {254, 298}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {166, 298}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {176, 298}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX020_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {151, 287}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {172, 281}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {172, 287}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {189, 273}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(transformation(origin = {181, 273}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_p_HX020_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {161, 273}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {153, 114}, extent = {{12, 12}, {-12, -12}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {194, 126}, extent = {{3, 3}, {-3, -3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {172, 126}, extent = {{-3, 3}, {3, -3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX020_out1(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {199, 109}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const21(k = 273.15) annotation(
    Placement(transformation(origin = {174, 103}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback21 annotation(
    Placement(transformation(origin = {174, 109}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Fluid.Sensors.Pressure p_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {165, 147}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Blocks.Math.Gain gain2(k = 1/1000) annotation(
    Placement(transformation(origin = {157, 147}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_p_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {137, 147}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {184, 126}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {165, 160}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {112, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*10000, startTime = 10) annotation(
    Placement(transformation(origin = {112, 47}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {68, 68}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX040 annotation(
    Placement(transformation(origin = {91, 68}, extent = {{4, -4}, {-4, 4}}, rotation = -180)));
  Modelica.Blocks.Math.Gain gain3(k = 1/1000) annotation(
    Placement(transformation(origin = {101, 97}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX040(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {122, 97}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor CpHX040(C = 10, T(start = 288.15)) annotation(
    Placement(transformation(origin = {135, 75}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cond_HX040(G = 10000) annotation(
    Placement(transformation(origin = {151, 68}, extent = {{5, 5}, {-5, -5}}, rotation = -180)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_PR(duration = 2, height = 2, offset = 10, startTime = 50) annotation(
    Placement(transformation(origin = {358, 248}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {331, 134}, extent = {{-4, 4}, {4, -4}}, rotation = -180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol_Cmp010_out(redeclare package Medium = fluid1, V = 0.01, nPorts = 2, use_portsData = false, use_HeatTransfer = true) annotation(
    Placement(transformation(origin = {312, 264}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Fluid.Machines.ControlledPump Cmp010(redeclare package Medium = fluid1, control_m_flow = false, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 1), m_flow_nominal = 1, p_a_nominal = 1e5, p_b_nominal = 1e6, use_p_set = true, p_a_start(displayUnit = "Pa") = 1, p_b_start(displayUnit = "Pa") = 1, T_start(displayUnit = "degC") = 288.15, checkValve = true, N_nominal = 1000, allowFlowReversal = false, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(transformation(origin = {312, 243}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol000(redeclare package Medium = fluid1, V = 0.1, nPorts = 2, use_portsData = false) annotation(
    Placement(transformation(origin = {312, 187}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {312, 226}, extent = {{3, 3}, {-3, -3}}, rotation = 270)));
  Modelica.Blocks.Continuous.PID PID(k = 500, Ti = 0.5, Td = 0.1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
    Placement(transformation(origin = {285, 264}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Feedback feedback3 annotation(
    Placement(transformation(origin = {272, 264}, extent = {{-4, 4}, {4, -4}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Vol_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {312, 276}, extent = {{3, 3}, {-3, -3}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Q_flow_Cmp010 annotation(
    Placement(transformation(origin = {298, 264}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP041(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {230, 126}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {343, 215}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const3(k = 273.15) annotation(
    Placement(transformation(origin = {323, 221}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback4 annotation(
    Placement(transformation(origin = {323, 215}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {312, 215}, extent = {{-3, 3}, {3, -3}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out1(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {293, 204}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {312, 204}, extent = {{3, 3}, {-3, -3}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_ph boundary(nPorts = 1, redeclare package Medium = fluid1, use_p_in = true, use_h_in = true) annotation(
    Placement(transformation(origin = {312, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort h_HX041_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {262, 126}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(redeclare package Medium = fluid1, nPorts = 1, use_h_in = false, use_p_in = true) annotation(
    Placement(transformation(origin = {286, 126}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain gain4(k = 100*1000) annotation(
    Placement(transformation(origin = {337, 248}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Vol_Cmp010_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {343, 289}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const31(k = 273.15) annotation(
    Placement(transformation(origin = {323, 295}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback41 annotation(
    Placement(transformation(origin = {323, 289}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Vol_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {312, 289}, extent = {{-3, 3}, {3, -3}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX020_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {230, 298}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX020_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {220, 298}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {138, 126}, extent = {{3, 3}, {-3, -3}}, rotation = 180)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {128, 126}, extent = {{-3, -3}, {3, 3}})));
equation
//
  Arr_s[1] = s_Cmp010_in.s;
  Arr_s[2] = s_Vol_Cmp010_out.s;
  Arr_s[3] = s_HX020_in.s;
  Arr_s[4] = s_HX020_out.s;
  Arr_s[5] = s_Valve030_in.s;
  Arr_s[6] = s_Valve030_out.s;
  Arr_s[7] = s_HX040_in.s;
  Arr_s[8] = s_HX040_out.s;
  Arr_s[9] = s_Cmp010_in.s;
//
  Arr_T[1] = T_Cmp010_in.T;
  Arr_T[2] = T_Vol_Cmp010_out.T;
  Arr_T[3] = T_HX020_in.T;
  Arr_T[4] = T_HX020_out.T;
  Arr_T[5] = T_Valve030_in.T;
  Arr_T[6] = T_Valve030_out.T;
  Arr_T[7] = T_HX040_in.T;
  Arr_T[8] = T_HX040_out.T;
  Arr_T[9] = T_Cmp010_in.T;
/*  */
//
  connect(ramp_Valve030_open.y, Valve030.opening) annotation(
    Line(points = {{62.5, 211}, {74, 211}}, color = {0, 0, 127}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{73, 172.8}, {73, 170.8}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{65.65, 169}, {70.65, 169}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{72, 245.2}, {72, 247.2}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{63.65, 249}, {69.3, 249}}, color = {0, 0, 127}));
  connect(s_Valve030_in.port_b, T_Valve030_in.port_a) annotation(
    Line(points = {{84, 258.5}, {84, 252}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_in.T, feedback1.u1) annotation(
    Line(points = {{80.7, 249}, {74, 249}}, color = {0, 0, 127}));
  connect(rho_Valve030_in.d, realValue_rho_Valve030_in.numberPort) annotation(
    Line(points = {{87.3, 237}, {93.3, 237}}, color = {0, 0, 127}));
  connect(T_Valve030_in.port_b, rho_Valve030_in.port_a) annotation(
    Line(points = {{84, 246}, {84, 240}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_in.port_b, Valve030.port_a) annotation(
    Line(points = {{84, 234}, {84, 224}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_out.T, feedback.u1) annotation(
    Line(points = {{80.7, 169}, {74.7, 169}}, color = {0, 0, 127}));
  connect(T_Valve030_out.port_b, s_Valve030_out.port_a) annotation(
    Line(points = {{84, 166}, {84, 159}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.d, realValue_rho_Valve030_out.numberPort) annotation(
    Line(points = {{87.3, 182}, {94.3, 182}}, color = {0, 0, 127}));
  connect(Valve030.port_b, rho_Valve030_out.port_a) annotation(
    Line(points = {{84, 198}, {84, 185}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.port_b, T_Valve030_out.port_a) annotation(
    Line(points = {{84, 179}, {84, 172}}, color = {0, 127, 255}, thickness = 2));
  connect(Vol030.ports[1], s_Valve030_in.port_a) annotation(
    Line(points = {{84, 272}, {84, 264.5}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Valve030_out.port_b, Vol031.ports[1]) annotation(
    Line(points = {{84, 153}, {84, 132}}, color = {0, 127, 255}, thickness = 2));
  connect(dP031.port_a, Vol031.ports[2]) annotation(
    Line(points = {{92, 126}, {84, 126}, {84, 132}}, color = {0, 127, 255}, thickness = 2));
  connect(dP021.port_b, Vol030.ports[2]) annotation(
    Line(points = {{92, 298}, {84, 298}, {84, 272}}, color = {0, 127, 255}, thickness = 2));
  connect(gain1.y, realValue_Q_flow_HX020.numberPort) annotation(
    Line(points = {{126.3, 371}, {131.6, 371}}, color = {0, 0, 127}));
  connect(T_hot.port, Q_flow_HX020.port_b) annotation(
    Line(points = {{102, 344}, {111, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX020.port_a, conv_HX020.fluid) annotation(
    Line(points = {{119, 344}, {126, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{136, 327.4}, {136, 334.8}}, color = {0, 0, 127}));
  connect(gain1.u, Q_flow_HX020.Q_flow) annotation(
    Line(points = {{119.4, 371}, {115, 371}, {115, 348}}, color = {0, 0, 127}));
  connect(cond_HX020.port_a, HX020.heatPort) annotation(
    Line(points = {{178, 344}, {185, 344}, {185, 310}}, color = {191, 0, 0}, thickness = 2));
  connect(CpHX020.port, cond_HX020.port_b) annotation(
    Line(points = {{157, 344}, {167, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(conv_HX020.solid, CpHX020.port) annotation(
    Line(points = {{146, 344}, {157, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(dP011.port_a, m_flow_Cmp010_out.port_b) annotation(
    Line(points = {{262, 298}, {273, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX020_out.port_a, HX020.ports[1]) annotation(
    Line(points = {{179, 298}, {198, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX020_out.port_a, T_HX020_out.port_b) annotation(
    Line(points = {{169, 298}, {173, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{172, 283}, {172, 285}}, color = {0, 0, 127}));
  connect(realValue_T_HX020_out.numberPort, feedback2.y) annotation(
    Line(points = {{164, 287}, {170, 287}}, color = {0, 0, 127}));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{174, 287}, {176, 287}, {176, 295}}, color = {0, 0, 127}));
  connect(dP021.port_a, s_HX020_out.port_b) annotation(
    Line(points = {{108, 298}, {163, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[2], p_HX020_out.port) annotation(
    Line(points = {{198, 298}, {189, 298}, {189, 276}}, color = {0, 127, 255}));
  connect(gain.u, p_HX020_out.p) annotation(
    Line(points = {{183.4, 273}, {186.4, 273}}, color = {0, 0, 127}));
  connect(realValue_p_HX020_out.numberPort, gain.y) annotation(
    Line(points = {{173.65, 273}, {178.65, 273}}, color = {0, 0, 127}));
  connect(const21.y, feedback21.u2) annotation(
    Line(points = {{174, 105.2}, {174, 107.4}}, color = {0, 0, 127}));
  connect(realValue_T_HX020_out1.numberPort, feedback21.y) annotation(
    Line(points = {{186.35, 109}, {176, 109}}, color = {0, 0, 127}));
  connect(feedback21.u1, T_HX040_out.T) annotation(
    Line(points = {{172, 109}, {172, 123}}, color = {0, 0, 127}));
  connect(HX040.ports[1], T_HX040_out.port_a) annotation(
    Line(points = {{153, 126}, {169, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(gain2.u, p_HX040_out.p) annotation(
    Line(points = {{159.4, 147}, {162, 147}}, color = {0, 0, 127}));
  connect(realValue_p_HX040_out.numberPort, gain2.y) annotation(
    Line(points = {{149.65, 147}, {154.65, 147}}, color = {0, 0, 127}));
  connect(HX040.ports[2], p_HX040_out.port) annotation(
    Line(points = {{153, 126}, {165, 126}, {165, 144}}, color = {0, 127, 255}));
  connect(realValue_rho_HX040_out.numberPort, rho_HX040_out.d) annotation(
    Line(points = {{174, 160}, {184, 160}, {184, 129}}, color = {0, 0, 127}));
  connect(gain3.y, realValue_Q_flow_HX040.numberPort) annotation(
    Line(points = {{104.3, 97}, {109.6, 97}}, color = {0, 0, 127}));
  connect(ramp_HX040_hconv.y, conv_HX040.Gc) annotation(
    Line(points = {{112, 51.4}, {112, 58.8}}, color = {0, 0, 127}));
  connect(gain3.u, Q_flow_HX040.Q_flow) annotation(
    Line(points = {{97.4, 97}, {91.4, 97}, {91.4, 72}}, color = {0, 0, 127}));
  connect(conv_HX040.solid, CpHX040.port) annotation(
    Line(points = {{122, 68}, {135, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(T_cold.port, Q_flow_HX040.port_a) annotation(
    Line(points = {{78, 68}, {87, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX040.port_b, conv_HX040.fluid) annotation(
    Line(points = {{95, 68}, {102, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(CpHX040.port, cond_HX040.port_a) annotation(
    Line(points = {{135, 68}, {145, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(cond_HX040.port_b, HX040.heatPort) annotation(
    Line(points = {{156, 68}, {165, 68}, {165, 114}}, color = {191, 0, 0}, thickness = 2));
  connect(realValue_m_flow_Cmp010_out.numberPort, m_flow_Cmp010_out.m_flow) annotation(
    Line(points = {{286.35, 325}, {278, 325}, {278, 303.5}}, color = {0, 0, 127}));
  connect(Cmp010.port_b, Vol_Cmp010_out.ports[1]) annotation(
    Line(points = {{312, 253}, {312, 259}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_out.port_b, rho_HX040_out.port_a) annotation(
    Line(points = {{175, 126}, {181, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_HX040_out.port_b, s_HX040_out.port_a) annotation(
    Line(points = {{187, 126}, {191, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(Cmp010.port_a, s_Cmp010_in.port_b) annotation(
    Line(points = {{312, 233}, {312, 228}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Vol_Cmp010_out.port_a, Vol_Cmp010_out.ports[2]) annotation(
    Line(points = {{312, 273}, {312, 260}}, color = {0, 127, 255}, thickness = 2));
  connect(feedback3.y, PID.u) annotation(
    Line(points = {{275.6, 264}, {279, 264}}, color = {0, 0, 127}));
  connect(s_Cmp010_in.s, feedback3.u1) annotation(
    Line(points = {{308.7, 226}, {269.7, 226}, {269.7, 264}}, color = {0, 0, 127}));
  connect(PID.y, Q_flow_Cmp010.Q_flow) annotation(
    Line(points = {{290.5, 264}, {294, 264}}, color = {0, 0, 127}));
  connect(s_Vol_Cmp010_out.s, feedback3.u2) annotation(
    Line(points = {{308.7, 276}, {271.7, 276}, {271.7, 267}}, color = {0, 0, 127}));
  connect(Q_flow_Cmp010.port, Vol_Cmp010_out.heatPort) annotation(
    Line(points = {{302, 264}, {308, 264}}, color = {191, 0, 0}, thickness = 0.5));
  connect(const3.y, feedback4.u2) annotation(
    Line(points = {{323, 218.8}, {323, 217}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_in.numberPort, feedback4.y) annotation(
    Line(points = {{330.35, 215}, {325.35, 215}}, color = {0, 0, 127}));
  connect(T_Cmp010_in.T, feedback4.u1) annotation(
    Line(points = {{315.3, 215}, {321, 215}}, color = {0, 0, 127}));
  connect(T_Cmp010_in.port_b, s_Cmp010_in.port_a) annotation(
    Line(points = {{312, 218}, {312, 224}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Cmp010_in.d, realValue_rho_Valve030_out1.numberPort) annotation(
    Line(points = {{308.7, 204}, {301.7, 204}}, color = {0, 0, 127}));
  connect(rho_Cmp010_in.port_b, T_Cmp010_in.port_a) annotation(
    Line(points = {{312, 207}, {312, 212}}, color = {0, 127, 255}, thickness = 2));
  connect(Vol000.ports[1], rho_Cmp010_in.port_a) annotation(
    Line(points = {{312, 180}, {312, 201}}, color = {0, 127, 255}, thickness = 2));
  connect(boundary.ports[1], Vol000.ports[2]) annotation(
    Line(points = {{312, 172}, {312, 180}}, color = {0, 127, 255}, thickness = 2));
  connect(boundary1.p_in, ramp_p1.y) annotation(
    Line(points = {{298, 134}, {327, 134}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{327, 134}, {303, 134}, {303, 150}, {304, 150}}, color = {0, 0, 127}));
  connect(h_HX041_out.h_out, boundary.h_in) annotation(
    Line(points = {{262, 129}, {262, 142}, {308, 142}, {308, 150}}, color = {0, 0, 127}, thickness = 2));
  connect(gain4.y, Cmp010.p_set) annotation(
    Line(points = {{332.6, 248}, {320.6, 248}}, color = {0, 0, 127}));
  connect(gain4.u, ramp_Cmp010_PR.y) annotation(
    Line(points = {{341.8, 248}, {351.8, 248}}, color = {0, 0, 127}));
  connect(const31.y, feedback41.u2) annotation(
    Line(points = {{323, 292.8}, {323, 291}}, color = {0, 0, 127}));
  connect(realValue_T_Vol_Cmp010_out.numberPort, feedback41.y) annotation(
    Line(points = {{330.35, 289}, {325.35, 289}}, color = {0, 0, 127}));
  connect(T_Vol_Cmp010_out.T, feedback41.u1) annotation(
    Line(points = {{315, 289}, {321, 289}}, color = {0, 0, 127}));
  connect(m_flow_Cmp010_out.port_a, T_Vol_Cmp010_out.port_b) annotation(
    Line(points = {{283, 298}, {312, 298}, {312, 292}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Vol_Cmp010_out.port_b, T_Vol_Cmp010_out.port_a) annotation(
    Line(points = {{312, 280}, {312, 286}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[3], s_HX020_in.port_b) annotation(
    Line(points = {{198, 298}, {217, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX020_in.port_a, T_HX020_in.port_b) annotation(
    Line(points = {{223, 298}, {227, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX020_in.port_a, dP011.port_b) annotation(
    Line(points = {{233, 298}, {246, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(dP031.port_b, s_HX040_in.port_a) annotation(
    Line(points = {{108, 126}, {125, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX040_in.port_b, T_HX040_in.port_a) annotation(
    Line(points = {{131, 126}, {135, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_in.port_b, HX040.ports[3]) annotation(
    Line(points = {{141, 126}, {154, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(dP041.port_a, s_HX040_out.port_b) annotation(
    Line(points = {{222, 126}, {198, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(dP041.port_b, h_HX041_out.port_a) annotation(
    Line(points = {{238, 126}, {259, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(h_HX041_out.port_b, boundary1.ports[1]) annotation(
    Line(points = {{265, 126}, {276, 126}}, color = {0, 127, 255}, thickness = 2));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 380}, {380, 0}}), graphics = {Text(origin = {61, 164}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {59, 243}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 178}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 233}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {309, 319}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/s]", horizontalAlignment = TextAlignment.Left), Text(origin = {154, 365}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {159, 281}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {175, 267}, extent = {{-5, 2}, {5, -2}}, textString = "[kPa]", horizontalAlignment = TextAlignment.Left), Text(origin = {209, 103}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {151, 141}, extent = {{-5, 2}, {5, -2}}, textString = "[kPa]", horizontalAlignment = TextAlignment.Left), Text(origin = {170, 156}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {130, 91}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {298, 200}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {351, 210}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {351, 284}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left)}),
    version = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end RefrigCycleMachine_R134_ex03;