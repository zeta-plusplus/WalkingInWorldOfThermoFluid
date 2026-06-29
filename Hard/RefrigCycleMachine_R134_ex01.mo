within WalkingInWorldOfThermoFluid.Hard;

model RefrigCycleMachine_R134_ex01
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
  Modelica.Fluid.Machines.ControlledPump Cmp010(redeclare package Medium = fluid1, p_a_nominal = 1e5, p_b_nominal = 1e6, m_flow_nominal = 1, control_m_flow = false, use_p_set = true) annotation(
    Placement(transformation(origin = {288, 224}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_pOut(height = 1*100*1000, duration = 1, offset = 10*100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {313, 229}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 9e5, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {84, 208}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {61, 206}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, use_portsData = false, use_HeatTransfer = true, V = 0.1, nPorts = 4, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(transformation(origin = {188, 268}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {178, 298}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {149, 298}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {178, 342}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 5, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {114, 120}, extent = {{10, 10}, {-10, -10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {124, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {151, 86}, extent = {{-5, 5}, {5, -5}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {124, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Temperature T_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {139, 118}, extent = {{-3, 3}, {3, -3}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy h_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {133, 103}, extent = {{-5, 5}, {5, -5}})));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {280, 125}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Fluid.Sensors.Temperature T_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {75, 191}, extent = {{-4, 4}, {4, -4}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {166, 274}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Fluid.Sensors.Temperature T_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {299, 240}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature T_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {302, 206}, extent = {{3, 3}, {-3, -3}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {57, 173}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {59, 251}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(transformation(origin = {68, 182}, extent = {{-2, -2}, {2, 2}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {75, 182}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const1(k = 273.15) annotation(
    Placement(transformation(origin = {70, 238}, extent = {{-2, -2}, {2, 2}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {76, 238}, extent = {{-2, 2}, {2, -2}}, rotation = 90)));
  Modelica.Fluid.Sensors.Temperature T_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {76, 229}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {137, 274}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {158, 282}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {158, 274}, extent = {{-2, -2}, {2, 2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {162, 118}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const3(k = 273.15) annotation(
    Placement(transformation(origin = {145, 112}, extent = {{-2, 2}, {2, -2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback3 annotation(
    Placement(transformation(origin = {145, 118}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {319, 192}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const4(k = 273.15) annotation(
    Placement(transformation(origin = {308, 199}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Math.Feedback feedback4 annotation(
    Placement(transformation(origin = {302, 199}, extent = {{2, -2}, {-2, 2}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {316, 253}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const5(k = 273.15) annotation(
    Placement(transformation(origin = {306, 246}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Math.Feedback feedback5 annotation(
    Placement(transformation(origin = {299, 246}, extent = {{2, 2}, {-2, -2}}, rotation = -90)));
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
  Modelica.Fluid.Sensors.Density rho_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {280, 244}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Fluid.Sensors.Density rho_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {280, 202}, extent = {{4, 4}, {-4, -4}})));
  Modelica.Fluid.Sensors.Density rho_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {170, 250}, extent = {{-4, 4}, {4, -4}})));
  Modelica.Fluid.Sensors.Density rho_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {94, 233}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Fluid.Sensors.Density rho_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {94, 187}, extent = {{-4, 4}, {4, -4}})));
  Modelica.Fluid.Sensors.Density rho_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {126, 142}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {143, 142}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {111, 187}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {111, 233}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX020_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {187, 250}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {263, 244}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {263, 202}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 189}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = fluid1, use_p_in = true, use_h_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {288, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {262, 258}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 246}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 172}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {158, 130}, extent = {{-4, -4}, {4, 4}})));
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
  connect(ramp_Cmp010_pOut.y, Cmp010.p_set) annotation(
    Line(points = {{307.5, 229}, {296, 229}}, color = {0, 0, 127}));
  connect(ramp_Valve030_open.y, Valve030.opening) annotation(
    Line(points = {{66.5, 206}, {71.25, 206}, {71.25, 208}, {76, 208}}, color = {0, 0, 127}));
  connect(conv_HX020.solid, HX020.heatPort) annotation(
    Line(points = {{178, 288}, {178, 268}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{154.5, 298}, {168.5, 298}}, color = {0, 0, 127}));
  connect(HX040.heatPort, conv_HX040.solid) annotation(
    Line(points = {{124, 120}, {124, 96}}, color = {191, 0, 0}, thickness = 2));
  connect(conv_HX040.Gc, ramp_HX040_hconv.y) annotation(
    Line(points = {{134, 86}, {146, 86}}, color = {0, 0, 127}));
  connect(HX040.ports[1], T_HX040_out.port) annotation(
    Line(points = {{114, 130}, {139, 130}, {139, 121}}, color = {0, 127, 255}));
  connect(HX040.ports[2], h_HX040_out.port) annotation(
    Line(points = {{114, 130}, {133, 130}, {133, 108}}, color = {0, 127, 255}));
  connect(ramp_p1.y, boundary1.p_in) annotation(
    Line(points = {{280, 129.4}, {280, 138.4}, {272, 138.4}}, color = {0, 0, 127}));
  connect(T_Valve030_out.port, Valve030.port_b) annotation(
    Line(points = {{79, 191}, {84, 191}, {84, 198}}, color = {0, 127, 255}));
  connect(HX020.ports[1], T_HX020_out.port) annotation(
    Line(points = {{188, 258}, {166, 258}, {166, 270}}, color = {0, 127, 255}));
  connect(T_Cmp010_out.port, Cmp010.port_b) annotation(
    Line(points = {{296, 240}, {288, 240}, {288, 234}}, color = {0, 127, 255}));
  connect(T_Cmp010_in.port, Cmp010.port_a) annotation(
    Line(points = {{299, 206}, {289, 206}, {288, 214}}, color = {0, 127, 255}));
  connect(T_Valve030_out.T, feedback.u1) annotation(
    Line(points = {{75, 188.2}, {75, 184.2}}, color = {0, 0, 127}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{70.2, 182}, {73.2, 182}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{69.65, 173}, {74.3, 173}, {74.3, 180}, {74.65, 180}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{72.2, 238}, {74.2, 238}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{71.65, 251}, {75.65, 251}, {75.65, 240}}, color = {0, 0, 127}));
  connect(T_Valve030_in.port, Valve030.port_a) annotation(
    Line(points = {{80, 229}, {80, 227}, {84, 227}, {84, 218}}, color = {0, 127, 255}));
  connect(T_Valve030_in.T, feedback1.u1) annotation(
    Line(points = {{76, 231.8}, {76, 235.8}}, color = {0, 0, 127}));
  connect(realValue_T_HX030_out.numberPort, feedback2.y) annotation(
    Line(points = {{149.65, 274}, {155.3, 274}}, color = {0, 0, 127}));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{159.6, 274}, {163.6, 274}}, color = {0, 0, 127}));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{158, 279.8}, {158, 275.8}}, color = {0, 0, 127}));
  connect(realValue_T_HX040_out.numberPort, feedback3.y) annotation(
    Line(points = {{149.35, 118}, {147.35, 118}}, color = {0, 0, 127}));
  connect(const3.y, feedback3.u2) annotation(
    Line(points = {{145, 114.2}, {145, 116.2}}, color = {0, 0, 127}));
  connect(T_HX040_out.T, feedback3.u1) annotation(
    Line(points = {{141.1, 118}, {143.1, 118}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_in.numberPort, feedback4.y) annotation(
    Line(points = {{306.35, 192}, {301.7, 192}, {301.7, 197}, {302, 197}}, color = {0, 0, 127}));
  connect(T_Cmp010_in.T, feedback4.u1) annotation(
    Line(points = {{302, 203.9}, {302, 200.9}}, color = {0, 0, 127}));
  connect(feedback4.u2, const4.y) annotation(
    Line(points = {{303.6, 199}, {305.2, 199}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_out.numberPort, feedback5.y) annotation(
    Line(points = {{303.35, 253}, {299, 253}, {299, 248}}, color = {0, 0, 127}));
  connect(feedback5.u2, const5.y) annotation(
    Line(points = {{300.6, 246}, {304, 246}}, color = {0, 0, 127}));
  connect(T_Cmp010_out.T, feedback5.u1) annotation(
    Line(points = {{299, 242.1}, {299, 244.1}}, color = {0, 0, 127}));
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
  connect(rho_Cmp010_out.port, Cmp010.port_b) annotation(
    Line(points = {{280, 240}, {288, 240}, {288, 234}}, color = {0, 127, 255}));
  connect(rho_Cmp010_in.port, Cmp010.port_a) annotation(
    Line(points = {{280, 206}, {288, 206}, {288, 214}}, color = {0, 127, 255}));
  connect(rho_HX020_out.port, HX020.ports[2]) annotation(
    Line(points = {{170, 254}, {170, 258}, {188, 258}}, color = {0, 127, 255}));
  connect(rho_Valve030_in.port, Valve030.port_a) annotation(
    Line(points = {{94, 229}, {94, 227}, {84, 227}, {84, 218}}, color = {0, 127, 255}));
  connect(rho_Valve030_out.port, Valve030.port_b) annotation(
    Line(points = {{94, 191}, {84, 191}, {84, 198}}, color = {0, 127, 255}));
  connect(rho_HX040_out.port, HX040.ports[3]) annotation(
    Line(points = {{126, 138}, {126, 130}, {114, 130}}, color = {0, 127, 255}));
  connect(rho_HX040_out.d, realValue_rho_HX040_out.numberPort) annotation(
    Line(points = {{130.4, 142}, {134.4, 142}}, color = {0, 0, 127}));
  connect(rho_Valve030_out.d, realValue_rho_Valve030_out.numberPort) annotation(
    Line(points = {{98.4, 187}, {102.4, 187}}, color = {0, 0, 127}));
  connect(rho_Valve030_in.d, realValue_rho_Valve030_in.numberPort) annotation(
    Line(points = {{98.4, 233}, {102.4, 233}}, color = {0, 0, 127}));
  connect(rho_HX020_out.d, realValue_rho_HX020_out.numberPort) annotation(
    Line(points = {{174.4, 250}, {178.4, 250}}, color = {0, 0, 127}));
  connect(realValue_rho_Cmp010_out.numberPort, rho_Cmp010_out.d) annotation(
    Line(points = {{272.2, 244}, {276.2, 244}}, color = {0, 0, 127}));
  connect(rho_Cmp010_in.d, realValue_rho_Cmp010_in.numberPort) annotation(
    Line(points = {{275.6, 202}, {271.6, 202}}, color = {0, 0, 127}));
  connect(s_Cmp010_in.port_b, Cmp010.port_a) annotation(
    Line(points = {{288, 193}, {288, 214}}, color = {0, 127, 255}, thickness = 2));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{280, 129.4}, {280, 145.4}}, color = {0, 0, 127}));
  connect(h_HX040_out.h_out, boundary.h_in) annotation(
    Line(points = {{138.5, 103}, {284, 103}, {284, 146}}, color = {0, 0, 127}));
  connect(boundary.ports[1], s_Cmp010_in.port_a) annotation(
    Line(points = {{288, 168}, {288, 185}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[3], s_Cmp010_out.port_b) annotation(
    Line(points = {{188, 258}, {258, 258}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Cmp010_out.port_a, Cmp010.port_b) annotation(
    Line(points = {{266, 258}, {288, 258}, {288, 234}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[4], s_Valve030_in.port_a) annotation(
    Line(points = {{188, 258}, {84, 258}, {84, 250}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Valve030_in.port_b, Valve030.port_a) annotation(
    Line(points = {{84, 242}, {84, 218}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Valve030_out.port_a, Valve030.port_b) annotation(
    Line(points = {{84, 176}, {84, 198}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Valve030_out.port_b, HX040.ports[4]) annotation(
    Line(points = {{84, 168}, {84, 130}, {114, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(HX040.ports[5], s_HX040_out.port_a) annotation(
    Line(points = {{114, 130}, {154, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX040_out.port_b, boundary1.ports[1]) annotation(
    Line(points = {{162, 130}, {250, 130}}, color = {0, 127, 255}, thickness = 2));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 360}, {340, 0}}), graphics = {Text(origin = {65, 168}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {67, 246}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {147, 269}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {168, 113}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {326, 187}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {324, 248}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {165, 59}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {219, 311}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {148, 138}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {116, 183}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {116, 229}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {192, 246}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {268, 240}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {268, 198}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left)}),
    version = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end RefrigCycleMachine_R134_ex01;
