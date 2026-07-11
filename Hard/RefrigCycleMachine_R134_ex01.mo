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
  Modelica.Fluid.Machines.ControlledPump Cmp010(redeclare package Medium = fluid1, p_a_nominal = 1e5, p_b_nominal = 1e6, m_flow_nominal = 1, control_m_flow = false, use_p_set = true, use_powerCharacteristic = false, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 1)) annotation(
    Placement(transformation(origin = {288, 224}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 9e5, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {84, 208}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {61, 208}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, use_portsData = false, use_HeatTransfer = true, V = 0.1, nPorts = 4, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(transformation(origin = {188, 294}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {178, 324}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {149, 324}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {178, 368}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {114, 120}, extent = {{10, 10}, {-10, -10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {124, 88}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {151, 88}, extent = {{-5, 5}, {5, -5}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {124, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {280, 97}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Fluid.Sensors.Temperature T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {166, 300}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {53, 177}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {51, 239}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(transformation(origin = {73, 183}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {73, 177}, extent = {{-2, -2}, {2, 2}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const1(k = 273.15) annotation(
    Placement(transformation(origin = {72, 233}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {72, 239}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {137, 300}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {158, 308}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {158, 300}, extent = {{-2, -2}, {2, 2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {153, 118}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const3(k = 273.15) annotation(
    Placement(transformation(origin = {134, 112}, extent = {{-2, 2}, {2, -2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback3 annotation(
    Placement(transformation(origin = {134, 118}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {327, 195}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const4(k = 273.15) annotation(
    Placement(transformation(origin = {300, 189}, extent = {{2, -2}, {-2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback4 annotation(
    Placement(transformation(origin = {300, 195}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {320, 251}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const5(k = 273.15) annotation(
    Placement(transformation(origin = {301, 258}, extent = {{2, -2}, {-2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback5 annotation(
    Placement(transformation(origin = {301, 251}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX040 annotation(
    Placement(transformation(origin = {124, 67}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(transformation(origin = {136, 67}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX040(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {157, 67}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX020 annotation(
    Placement(transformation(origin = {178, 345}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {190, 345}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX0401(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {211, 345}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Fluid.Sensors.Density rho_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {170, 276}, extent = {{-4, 4}, {4, -4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {125, 144}, extent = {{8, -5}, {-8, 5}}, rotation = -0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 190}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 227}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX020_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {187, 276}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {263, 242}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {267, 206}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 183}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = fluid1, use_p_in = true, use_h_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {288, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {285, 284}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 251.5}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 164}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {150, 130}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_PR(duration = 1, height = 1, offset = 10, startTime = 10) annotation(
    Placement(transformation(origin = {323, 231}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Product product annotation(
    Placement(transformation(origin = {305, 229}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 239}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 227}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 177}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 190}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort h_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {176, 130}, extent = {{-3, 3}, {3, -3}}, rotation = -0)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {140, 130}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {129, 130}, extent = {{3, -3}, {-3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 195}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 206}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 242}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 251}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
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
    Line(points = {{66.5, 208}, {76, 208}}, color = {0, 0, 127}));
  connect(conv_HX020.solid, HX020.heatPort) annotation(
    Line(points = {{178, 314}, {178, 294}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{154.5, 324}, {168.5, 324}}, color = {0, 0, 127}));
  connect(conv_HX040.Gc, ramp_HX040_hconv.y) annotation(
    Line(points = {{134, 88}, {146, 88}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary1.p_in) annotation(
    Line(points = {{280, 101}, {280, 138.4}, {272, 138.4}}, color = {0, 0, 127}));
  connect(HX020.ports[1], T_HX020_out.port) annotation(
    Line(points = {{188, 284}, {166, 284}, {166, 296}}, color = {0, 127, 255}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{73, 180.8}, {73, 178.8}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{65.65, 177}, {70.65, 177}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{72, 235.2}, {72, 237.2}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{63.65, 239}, {69.65, 239}}, color = {0, 0, 127}));
  connect(realValue_T_HX030_out.numberPort, feedback2.y) annotation(
    Line(points = {{149.65, 300}, {155.3, 300}}, color = {0, 0, 127}));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{159.6, 300}, {163.6, 300}}, color = {0, 0, 127}));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{158, 305.8}, {158, 301.8}}, color = {0, 0, 127}));
  connect(realValue_T_HX040_out.numberPort, feedback3.y) annotation(
    Line(points = {{140, 118}, {136, 118}}, color = {0, 0, 127}));
  connect(const3.y, feedback3.u2) annotation(
    Line(points = {{134, 114.2}, {134, 116.2}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_in.numberPort, feedback4.y) annotation(
    Line(points = {{314.35, 195}, {302, 195}}, color = {0, 0, 127}));
  connect(feedback4.u2, const4.y) annotation(
    Line(points = {{300, 193.4}, {300, 191}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_out.numberPort, feedback5.y) annotation(
    Line(points = {{307.35, 251}, {303, 251}}, color = {0, 0, 127}));
  connect(feedback5.u2, const5.y) annotation(
    Line(points = {{301, 253}, {301, 255.6}}, color = {0, 0, 127}));
  connect(Q_flow_HX040.port_b, conv_HX040.fluid) annotation(
    Line(points = {{124, 71}, {124, 78}}, color = {191, 0, 0}, thickness = 2));
  connect(T_cold.port, Q_flow_HX040.port_a) annotation(
    Line(points = {{124, 56}, {124, 63}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX040.Q_flow, gain.u) annotation(
    Line(points = {{128.4, 67}, {132.4, 67}}, color = {0, 0, 127}));
  connect(gain.y, realValue_Q_flow_HX040.numberPort) annotation(
    Line(points = {{139.3, 67}, {144.3, 67}}, color = {0, 0, 127}));
  connect(Q_flow_HX020.Q_flow, gain1.u) annotation(
    Line(points = {{182.4, 345}, {186.4, 345}}, color = {0, 0, 127}));
  connect(gain1.y, realValue_Q_flow_HX0401.numberPort) annotation(
    Line(points = {{193.3, 345}, {198.3, 345}}, color = {0, 0, 127}));
  connect(conv_HX020.fluid, Q_flow_HX020.port_a) annotation(
    Line(points = {{178, 334}, {178, 342}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX020.port_b, T_hot.port) annotation(
    Line(points = {{178, 349}, {178, 357}}, color = {191, 0, 0}, thickness = 2));
  connect(rho_HX020_out.port, HX020.ports[2]) annotation(
    Line(points = {{170, 280}, {170, 284}, {188, 284}}, color = {0, 127, 255}));
  connect(rho_HX020_out.d, realValue_rho_HX020_out.numberPort) annotation(
    Line(points = {{174.4, 276}, {178.4, 276}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{280, 101}, {280, 145.4}}, color = {0, 0, 127}));
  connect(boundary.ports[1], s_Cmp010_in.port_a) annotation(
    Line(points = {{288, 168}, {288, 179}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[3], s_Cmp010_out.port_b) annotation(
    Line(points = {{188, 284}, {282, 284}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Valve030_out.port_b, HX040.ports[1]) annotation(
    Line(points = {{84, 161}, {84, 130}, {114, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(product.u1, ramp_Cmp010_PR.y) annotation(
    Line(points = {{309, 231}, {317.5, 231}}, color = {0, 0, 127}));
  connect(Cmp010.p_set, product.y) annotation(
    Line(points = {{296, 229}, {302, 229}}, color = {0, 0, 127}));
  connect(ramp_p1.y, product.u2) annotation(
    Line(points = {{280, 101}, {280, 136}, {314, 136}, {314, 227}, {309, 227}}, color = {0, 0, 127}));
  connect(s_Valve030_in.port_b, T_Valve030_in.port_a) annotation(
    Line(points = {{84, 248.5}, {84, 242}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_in.T, feedback1.u1) annotation(
    Line(points = {{80.7, 239}, {74, 239}}, color = {0, 0, 127}));
  connect(rho_Valve030_in.d, realValue_rho_Valve030_in.numberPort) annotation(
    Line(points = {{87.3, 227}, {93.3, 227}}, color = {0, 0, 127}));
  connect(T_Valve030_in.port_b, rho_Valve030_in.port_a) annotation(
    Line(points = {{84, 236}, {84, 230}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_in.port_b, Valve030.port_a) annotation(
    Line(points = {{84, 224}, {84, 218}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_out.T, feedback.u1) annotation(
    Line(points = {{80.7, 177}, {74.7, 177}}, color = {0, 0, 127}));
  connect(T_Valve030_out.port_b, s_Valve030_out.port_a) annotation(
    Line(points = {{84, 174}, {84, 167}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.d, realValue_rho_Valve030_out.numberPort) annotation(
    Line(points = {{87, 190}, {94, 190}}, color = {0, 0, 127}));
  connect(Valve030.port_b, rho_Valve030_out.port_a) annotation(
    Line(points = {{84, 198}, {84, 193}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.port_b, T_Valve030_out.port_a) annotation(
    Line(points = {{84, 187}, {84, 180}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[4], s_Valve030_in.port_a) annotation(
    Line(points = {{188, 284}, {84, 284}, {84, 254.5}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_out.T, feedback3.u1) annotation(
    Line(points = {{129, 127}, {129, 118}, {132, 118}}, color = {0, 0, 127}));
  connect(HX040.ports[2], T_HX040_out.port_a) annotation(
    Line(points = {{114, 130}, {126, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_out.port_b, rho_HX040_out.port_a) annotation(
    Line(points = {{132, 130}, {137, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_HX040_out.port_b, s_HX040_out.port_a) annotation(
    Line(points = {{143, 130}, {147, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX040_out.port_b, h_HX040_out.port_a) annotation(
    Line(points = {{153, 130}, {173, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(h_HX040_out.port_b, boundary1.ports[1]) annotation(
    Line(points = {{179, 130}, {250, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(realValue_rho_HX040_out.numberPort, rho_HX040_out.d) annotation(
    Line(points = {{134, 144}, {140, 144}, {140, 134}}, color = {0, 0, 127}));
  connect(h_HX040_out.h_out, boundary.h_in) annotation(
    Line(points = {{176, 126}, {176, 110}, {284, 110}, {284, 146}}, color = {0, 0, 127}, thickness = 1));
  connect(T_Cmp010_in.T, feedback4.u1) annotation(
    Line(points = {{291, 195}, {298, 195}}, color = {0, 0, 127}));
  connect(s_Cmp010_in.port_b, T_Cmp010_in.port_a) annotation(
    Line(points = {{288, 187}, {288, 192}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Cmp010_in.port_b, rho_Cmp010_in.port_a) annotation(
    Line(points = {{288, 198}, {288, 203}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Cmp010_in.port_b, Cmp010.port_a) annotation(
    Line(points = {{288, 209}, {288, 214}}, color = {0, 127, 255}, thickness = 2));
  connect(realValue_rho_Cmp010_in.numberPort, rho_Cmp010_in.d) annotation(
    Line(points = {{276, 206}, {284, 206}}, color = {0, 0, 127}));
  connect(Cmp010.port_b, rho_Cmp010_out.port_a) annotation(
    Line(points = {{288, 234}, {288, 239}}, color = {0, 127, 255}, thickness = 2));
  connect(realValue_rho_Cmp010_out.numberPort, rho_Cmp010_out.d) annotation(
    Line(points = {{272, 242}, {285, 242}}, color = {0, 0, 127}));
  connect(rho_Cmp010_out.port_b, T_Cmp010_out.port_a) annotation(
    Line(points = {{288, 245}, {288, 248}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Cmp010_out.port_a, T_Cmp010_out.port_b) annotation(
    Line(points = {{288, 284}, {288, 254}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Cmp010_out.T, feedback5.u1) annotation(
    Line(points = {{291, 251}, {299, 251}}, color = {0, 0, 127}));
  connect(HX040.heatPort, conv_HX040.solid) annotation(
    Line(points = {{124, 120}, {124, 98}}, color = {191, 0, 0}, thickness = 2));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 380}, {340, 0}}), graphics = {Text(origin = {61, 168}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {59, 233}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {147, 295}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {159, 113}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {334, 190}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {328, 246}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {165, 61}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {219, 337}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {130, 140}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 186}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 223}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {194, 272}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {268, 238}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {272, 202}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left)}),
    version = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end RefrigCycleMachine_R134_ex01;