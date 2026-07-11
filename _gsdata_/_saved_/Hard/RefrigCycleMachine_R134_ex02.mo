within WalkingInWorldOfThermoFluid.Hard;

model RefrigCycleMachine_R134_ex02
  extends Modelica.Icons.Example;
  //-------------------------
  package fluid1 = Modelica.Media.R134a.R134a_ph;
  package fluid2 = Modelica.Media.Air.DryAirNasa;
  //-------------------------
  parameter Integer sigDigits_T = 4;
  parameter Integer sigDigits_p = 5;
  parameter Integer sigDigits_Q_flow = 5;
  parameter Integer sigDigits_m_flow = 4;
  parameter Integer sigDigits_rho = 4;
  //-------------------------
  constant Integer nArrStates = 6;
  Modelica.Units.SI.Temperature Arr_T[nArrStates];
  Modelica.Units.SI.SpecificEntropy Arr_s[nArrStates];
  //-------------------------
  inner Modelica.Fluid.System system(p_ambient = 1e5, T_ambient = 288.15) annotation(
    Placement(transformation(origin = {14, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 273.15, p = 1e5, nPorts = 1, use_p_in = true) annotation(
    Placement(transformation(origin = {260, 130}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Machines.ControlledPump Cmp010(redeclare package Medium = fluid1, p_a_nominal = 1e5, p_b_nominal = 1e6, m_flow_nominal = 1, control_m_flow = false, use_p_set = true, use_powerCharacteristic = false, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 1)) annotation(
    Placement(transformation(origin = {288, 224}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_PR(height = 1, duration = 1, offset = 10, startTime = 10) annotation(
    Placement(transformation(origin = {333, 231}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 9e5, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {84, 208}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {57, 208}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, use_portsData = false, use_HeatTransfer = true, V = 0.1, nPorts = 2, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(transformation(origin = {188, 268}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {178, 298}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {149, 298}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {178, 342}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {114, 120}, extent = {{10, 10}, {-10, -10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {124, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {151, 86}, extent = {{-5, 5}, {5, -5}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {124, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {280, 101}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {49, 172}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {47, 239}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(transformation(origin = {71, 178}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {71, 172}, extent = {{-2, -2}, {2, 2}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const1(k = 273.15) annotation(
    Placement(transformation(origin = {68, 232}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {68, 239}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {145, 282}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {158, 268}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {166, 268}, extent = {{2, -2}, {-2, 2}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {156, 116}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const3(k = 273.15) annotation(
    Placement(transformation(origin = {137, 110}, extent = {{-2, 2}, {2, -2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback3 annotation(
    Placement(transformation(origin = {137, 116}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {333, 194}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const4(k = 273.15) annotation(
    Placement(transformation(origin = {300, 187}, extent = {{2, -2}, {-2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback4 annotation(
    Placement(transformation(origin = {300, 194}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {320, 255}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const5(k = 273.15) annotation(
    Placement(transformation(origin = {301, 263}, extent = {{2, 2}, {-2, -2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback5 annotation(
    Placement(transformation(origin = {301, 255}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX040 annotation(
    Placement(transformation(origin = {124, 65}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(transformation(origin = {136, 65}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX040(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {157, 65}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX020 annotation(
    Placement(transformation(origin = {178, 319}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {190, 319}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX0401(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {211, 319}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {123, 146}, extent = {{8, -5}, {-8, 5}}, rotation = -0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {107, 182}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {107, 227}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX020_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {163, 246}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {263, 246}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {263, 204}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 184}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = fluid1, use_p_in = true, use_h_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {288, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {262, 258}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 250}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 162}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {156, 130}, extent = {{-3, -3}, {3, 3}})));
  FluidSystemComponents.Utilities.arr_Ts_const_p_00 curve_Ts_HX020(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {50, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure p_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {278, 271}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sensors.Pressure p_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {103, 195}, extent = {{-3, -3}, {3, 3}}, rotation = -0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = s_Cmp010_out.s) annotation(
    Placement(transformation(origin = {27, 92}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = s_Valve030_in.s) annotation(
    Placement(transformation(origin = {11, 88}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = p_Cmp010_out.p) annotation(
    Placement(transformation(origin = {11, 80}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression3[0](y = XiArr_Cmp010_out.Xi) annotation(
    Placement(transformation(origin = {27, 76}, extent = {{-7, -4}, {7, 4}})));
  FluidSystemComponents.Utilities.arr_Ts_const_p_00 curve_Ts_HX040(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {50, 54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = s_Valve030_out.s) annotation(
    Placement(transformation(origin = {9, 58}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = s_HX040_out.s) annotation(
    Placement(transformation(origin = {27, 62}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = p_Valve030_out.p) annotation(
    Placement(transformation(origin = {9, 50}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression7[0](y = XiArr_Valve030_out.Xi) annotation(
    Placement(transformation(origin = {27, 46}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Math.Product product annotation(
    Placement(transformation(origin = {305, 229}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 239}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 227}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 172}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 182}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort h_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {238, 130}, extent = {{-3, 3}, {3, -3}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {144, 130}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {131, 130}, extent = {{3, -3}, {-3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 194}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 204}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 246}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 255}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {166, 258}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {150, 258}, extent = {{3, 3}, {-3, -3}})));
  FluidSystemComponents.Sensor.MassFractionsArrayTwoPort XiArr_Valve030_out(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {84, 150}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  FluidSystemComponents.Sensor.MassFractionsArrayTwoPort XiArr_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {244, 258}, extent = {{-3, -3}, {3, 3}})));
equation
/**/
  Arr_s[1] = s_Cmp010_in.s;
  Arr_s[2] = s_Cmp010_out.s;
  Arr_s[3] = s_Valve030_in.s;
  Arr_s[4] = s_Valve030_out.s;
  Arr_s[5] = s_HX040_out.s;
  Arr_s[6] = s_Cmp010_in.s;
//
  Arr_T[1] = T_Cmp010_in.T;
  Arr_T[2] = T_Cmp010_out.T;
  Arr_T[3] = T_Valve030_in.T;
  Arr_T[4] = T_Valve030_out.T;
  Arr_T[5] = T_HX040_out.T;
  Arr_T[6] = T_Cmp010_in.T;
//
  connect(ramp_Valve030_open.y, Valve030.opening) annotation(
    Line(points = {{62.5, 208}, {76, 208}}, color = {0, 0, 127}));
  connect(conv_HX020.solid, HX020.heatPort) annotation(
    Line(points = {{178, 288}, {178, 268}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{154.5, 298}, {168.5, 298}}, color = {0, 0, 127}));
  connect(HX040.heatPort, conv_HX040.solid) annotation(
    Line(points = {{124, 120}, {124, 96}}, color = {191, 0, 0}, thickness = 2));
  connect(conv_HX040.Gc, ramp_HX040_hconv.y) annotation(
    Line(points = {{134, 86}, {146, 86}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary1.p_in) annotation(
    Line(points = {{280, 105}, {280, 138.4}, {272, 138.4}}, color = {0, 0, 127}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{71, 175.8}, {71, 173.8}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{61.65, 172}, {68.65, 172}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{68, 234.2}, {68, 237}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{59.65, 239}, {66, 239}}, color = {0, 0, 127}));
  connect(realValue_T_HX030_out.numberPort, feedback2.y) annotation(
    Line(points = {{157.65, 282}, {166, 282}, {166, 270}}, color = {0, 0, 127}));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{160, 268}, {164, 268}}, color = {0, 0, 127}));
  connect(realValue_T_HX040_out.numberPort, feedback3.y) annotation(
    Line(points = {{143.35, 116}, {139, 116}}, color = {0, 0, 127}));
  connect(const3.y, feedback3.u2) annotation(
    Line(points = {{137, 112.2}, {137, 114.2}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_in.numberPort, feedback4.y) annotation(
    Line(points = {{320, 194}, {302, 194}}, color = {0, 0, 127}));
  connect(feedback4.u2, const4.y) annotation(
    Line(points = {{300, 192.4}, {300, 189.4}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_out.numberPort, feedback5.y) annotation(
    Line(points = {{307.35, 255}, {303, 255}}, color = {0, 0, 127}));
  connect(feedback5.u2, const5.y) annotation(
    Line(points = {{301, 257}, {301, 260.6}}, color = {0, 0, 127}));
  connect(Q_flow_HX040.port_b, conv_HX040.fluid) annotation(
    Line(points = {{124, 69}, {124, 76}}, color = {191, 0, 0}, thickness = 2));
  connect(T_cold.port, Q_flow_HX040.port_a) annotation(
    Line(points = {{124, 54}, {124, 61}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX040.Q_flow, gain.u) annotation(
    Line(points = {{128.4, 65}, {132.4, 65}}, color = {0, 0, 127}));
  connect(gain.y, realValue_Q_flow_HX040.numberPort) annotation(
    Line(points = {{139.3, 65}, {144.3, 65}}, color = {0, 0, 127}));
  connect(Q_flow_HX020.Q_flow, gain1.u) annotation(
    Line(points = {{182.4, 319}, {186.4, 319}}, color = {0, 0, 127}));
  connect(gain1.y, realValue_Q_flow_HX0401.numberPort) annotation(
    Line(points = {{193.3, 319}, {198.3, 319}}, color = {0, 0, 127}));
  connect(conv_HX020.fluid, Q_flow_HX020.port_a) annotation(
    Line(points = {{178, 308}, {178, 316}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX020.port_b, T_hot.port) annotation(
    Line(points = {{178, 323}, {178, 331}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{280, 105}, {280, 145.4}}, color = {0, 0, 127}));
  connect(boundary.ports[1], s_Cmp010_in.port_a) annotation(
    Line(points = {{288, 168}, {288, 181}}, color = {0, 127, 255}, thickness = 2));
  connect(realExpression.y, curve_Ts_HX020.u_sUpper) annotation(
    Line(points = {{35, 92}, {40, 92}}, color = {0, 0, 127}));
  connect(realExpression1.y, curve_Ts_HX020.u_sLower) annotation(
    Line(points = {{19, 88}, {40, 88}}, color = {0, 0, 127}));
  connect(realExpression2.y, curve_Ts_HX020.u_p) annotation(
    Line(points = {{19, 80}, {40, 80}}, color = {0, 0, 127}));
  connect(p_Valve030_out.port, Valve030.port_b) annotation(
    Line(points = {{103, 192}, {84, 192}, {84, 198}}, color = {0, 127, 255}));
  connect(realExpression3.y, curve_Ts_HX020.u_Xi) annotation(
    Line(points = {{34, 76}, {40, 76}}, color = {0, 0, 127}, thickness = 0.5));
  connect(realExpression6.y, curve_Ts_HX040.u_p) annotation(
    Line(points = {{16, 50}, {40, 50}}, color = {0, 0, 127}));
  connect(realExpression7.y, curve_Ts_HX040.u_Xi) annotation(
    Line(points = {{34, 46}, {40, 46}}, color = {0, 0, 127}, thickness = 0.5));
  connect(realExpression4.y, curve_Ts_HX040.u_sLower) annotation(
    Line(points = {{16, 58}, {40, 58}}, color = {0, 0, 127}));
  connect(realExpression5.y, curve_Ts_HX040.u_sUpper) annotation(
    Line(points = {{34, 62}, {40, 62}}, color = {0, 0, 127}));
  connect(Cmp010.p_set, product.y) annotation(
    Line(points = {{296, 229}, {302, 229}}, color = {0, 0, 127}));
  connect(product.u1, ramp_Cmp010_PR.y) annotation(
    Line(points = {{309, 231}, {327.5, 231}}, color = {0, 0, 127}));
  connect(ramp_p1.y, product.u2) annotation(
    Line(points = {{280, 105}, {280, 136}, {314, 136}, {314, 227}, {309, 227}}, color = {0, 0, 127}));
  connect(s_Valve030_in.port_b, T_Valve030_in.port_a) annotation(
    Line(points = {{84, 247}, {84, 242}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_in.port_b, rho_Valve030_in.port_a) annotation(
    Line(points = {{84, 236}, {84, 230}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_in.port_b, Valve030.port_a) annotation(
    Line(points = {{84, 224}, {84, 218}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_in.d, realValue_rho_Valve030_in.numberPort) annotation(
    Line(points = {{87, 227}, {98, 227}}, color = {0, 0, 127}));
  connect(feedback1.u1, T_Valve030_in.T) annotation(
    Line(points = {{70, 239}, {81, 239}}, color = {0, 0, 127}));
  connect(rho_Valve030_out.port_a, Valve030.port_b) annotation(
    Line(points = {{84, 185}, {84, 198}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.port_b, T_Valve030_out.port_a) annotation(
    Line(points = {{84, 179}, {84, 175}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_out.port_b, s_Valve030_out.port_a) annotation(
    Line(points = {{84, 169}, {84, 165}}, color = {0, 127, 255}, thickness = 2));
  connect(feedback.u1, T_Valve030_out.T) annotation(
    Line(points = {{72, 172}, {81, 172}}, color = {0, 0, 127}));
  connect(rho_Valve030_out.d, realValue_rho_Valve030_out.numberPort) annotation(
    Line(points = {{87, 182}, {98, 182}}, color = {0, 0, 127}));
  connect(realValue_rho_HX040_out.numberPort, rho_HX040_out.d) annotation(
    Line(points = {{132, 146}, {144, 146}, {144, 133}}, color = {0, 0, 127}));
  connect(T_HX040_out.T, feedback3.u1) annotation(
    Line(points = {{131, 127}, {131, 116}, {135, 116}}, color = {0, 0, 127}));
  connect(HX040.ports[1], T_HX040_out.port_a) annotation(
    Line(points = {{114, 130}, {128, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_out.port_b, rho_HX040_out.port_a) annotation(
    Line(points = {{134, 130}, {141, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_HX040_out.port_b, s_HX040_out.port_a) annotation(
    Line(points = {{147, 130}, {153, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX040_out.port_b, h_HX040_out.port_a) annotation(
    Line(points = {{159, 130}, {235, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(h_HX040_out.port_b, boundary1.ports[1]) annotation(
    Line(points = {{241, 130}, {250, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(h_HX040_out.h_out, boundary.h_in) annotation(
    Line(points = {{238, 127}, {238, 114}, {284, 114}, {284, 146}}, color = {0, 0, 127}, thickness = 1));
  connect(realValue_rho_Cmp010_in.numberPort, rho_Cmp010_in.d) annotation(
    Line(points = {{272, 204}, {285, 204}}, color = {0, 0, 127}));
  connect(rho_Cmp010_in.port_b, Cmp010.port_a) annotation(
    Line(points = {{288, 207}, {288, 214}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Cmp010_in.port_b, rho_Cmp010_in.port_a) annotation(
    Line(points = {{288, 197}, {288, 201}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Cmp010_in.port_b, T_Cmp010_in.port_a) annotation(
    Line(points = {{288, 187}, {288, 191}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Cmp010_in.T, feedback4.u1) annotation(
    Line(points = {{291, 194}, {298, 194}}, color = {0, 0, 127}));
  connect(s_Cmp010_out.port_a, T_Cmp010_out.port_b) annotation(
    Line(points = {{265, 258}, {288, 258}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Cmp010_out.T, feedback5.u1) annotation(
    Line(points = {{291, 255}, {299, 255}}, color = {0, 0, 127}));
  connect(realValue_rho_Cmp010_out.numberPort, rho_Cmp010_out.d) annotation(
    Line(points = {{272, 246}, {285, 246}}, color = {0, 0, 127}));
  connect(rho_Cmp010_out.port_b, T_Cmp010_out.port_a) annotation(
    Line(points = {{288, 249}, {288, 252}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Cmp010_out.port_a, Cmp010.port_b) annotation(
    Line(points = {{288, 243}, {288, 234}}, color = {0, 127, 255}, thickness = 2));
  connect(p_Cmp010_out.port, T_Cmp010_out.port_b) annotation(
    Line(points = {{278, 268}, {278, 258}, {288, 258}}, color = {0, 127, 255}));
  connect(T_HX020_out.port_a, HX020.ports[1]) annotation(
    Line(points = {{169, 258}, {188, 258}}, color = {0, 127, 255}, thickness = 2));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{166, 266}, {166, 261}}, color = {0, 0, 127}));
  connect(T_HX020_out.port_b, rho_HX020_out.port_a) annotation(
    Line(points = {{163, 258}, {153, 258}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_HX020_out.port_b, s_Valve030_in.port_a) annotation(
    Line(points = {{147, 258}, {84, 258}, {84, 253}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_HX020_out.d, realValue_rho_HX020_out.numberPort) annotation(
    Line(points = {{150, 255}, {150, 246}, {154, 246}}, color = {0, 0, 127}));
  connect(s_Valve030_out.port_b, XiArr_Valve030_out.port_a) annotation(
    Line(points = {{84, 160}, {84, 153}}, color = {0, 127, 255}, thickness = 2));
  connect(HX040.ports[2], XiArr_Valve030_out.port_b) annotation(
    Line(points = {{114, 130}, {84, 130}, {84, 148}}, color = {0, 127, 255}, thickness = 2));
  connect(XiArr_Cmp010_out.port_b, s_Cmp010_out.port_b) annotation(
    Line(points = {{248, 258}, {260, 258}}, color = {0, 127, 255}, thickness = 2));
  connect(XiArr_Cmp010_out.port_a, HX020.ports[2]) annotation(
    Line(points = {{242, 258}, {188, 258}}, color = {0, 127, 255}, thickness = 2));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 360}, {340, 0}}), graphics = {Text(origin = {59, 167}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {55, 234}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {155, 277}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {164, 111}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {340, 189}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {328, 250}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {165, 59}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {219, 311}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {128, 142}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {112, 178}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {112, 223}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {168, 242}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {268, 242}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {268, 200}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left)}),
    version = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end RefrigCycleMachine_R134_ex02;