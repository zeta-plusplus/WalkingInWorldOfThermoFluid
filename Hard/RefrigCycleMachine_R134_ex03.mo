within WalkingInWorldOfThermoFluid.Hard;

model RefrigCycleMachine_R134_ex03
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
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 9e5, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {84, 208}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {61, 208}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, use_portsData = false, use_HeatTransfer = true, V = 0.1, nPorts = 4, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(transformation(origin = {188, 308}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {178, 338}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {149, 338}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {178, 382}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {114, 120}, extent = {{10, 10}, {-10, -10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {124, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {151, 86}, extent = {{-5, 5}, {5, -5}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {124, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {280, 97}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Fluid.Sensors.Temperature T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {166, 314}, extent = {{4, -4}, {-4, 4}})));
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
    Placement(transformation(origin = {137, 314}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {158, 322}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {158, 314}, extent = {{-2, -2}, {2, 2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {153, 118}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const3(k = 273.15) annotation(
    Placement(transformation(origin = {134, 112}, extent = {{-2, 2}, {2, -2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback3 annotation(
    Placement(transformation(origin = {134, 118}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {327, 187}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const4(k = 273.15) annotation(
    Placement(transformation(origin = {300, 181}, extent = {{2, -2}, {-2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback4 annotation(
    Placement(transformation(origin = {300, 187}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {320, 285}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const5(k = 273.15) annotation(
    Placement(transformation(origin = {301, 292}, extent = {{2, -2}, {-2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback5 annotation(
    Placement(transformation(origin = {301, 285}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX040 annotation(
    Placement(transformation(origin = {124, 65}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(transformation(origin = {136, 65}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX040(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {157, 65}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX020 annotation(
    Placement(transformation(origin = {178, 359}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {190, 359}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX0401(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {211, 359}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Fluid.Sensors.Density rho_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {170, 290}, extent = {{-4, 4}, {4, -4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {125, 144}, extent = {{8, -5}, {-8, 5}}, rotation = -0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 190}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 227}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX020_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {187, 290}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {263, 272}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Cmp010_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {267, 198}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 213}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = fluid1, use_p_in = true, use_h_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {288, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 260}, extent = {{3, 3}, {-3, -3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 249.5}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 164}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {150, 130}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_PR(duration = 1, height = 1, offset = 10, startTime = 10) annotation(
    Placement(transformation(origin = {334, 238}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Product product annotation(
    Placement(transformation(origin = {315, 236}, extent = {{4, -4}, {-4, 4}})));
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
    Placement(transformation(origin = {288, 187}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 198}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 272}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {288, 285}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {272.833, 228.25}, extent = {{-6.25, -4.83333}, {6.25, 4.83333}}, rotation = 90)));
  Modelica.Fluid.Sources.MassFlowSource_T Cmp010_in(redeclare package Medium = fluid1, m_flow = -1, nPorts = 1)  annotation(
    Placement(transformation(origin = {288, 225}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_ph Cmp010_out(redeclare package Medium = fluid1, nPorts = 1, use_h_in = true, use_p_in = true) annotation(
    Placement(transformation(origin = {288, 247}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
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
    Line(points = {{178, 328}, {178, 308}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{154.5, 338}, {168.5, 338}}, color = {0, 0, 127}));
  connect(HX040.heatPort, conv_HX040.solid) annotation(
    Line(points = {{124, 120}, {124, 96}}, color = {191, 0, 0}, thickness = 2));
  connect(conv_HX040.Gc, ramp_HX040_hconv.y) annotation(
    Line(points = {{134, 86}, {146, 86}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary1.p_in) annotation(
    Line(points = {{280, 101}, {280, 138.4}, {272, 138.4}}, color = {0, 0, 127}));
  connect(HX020.ports[1], T_HX020_out.port) annotation(
    Line(points = {{188, 298}, {166, 298}, {166, 310}}, color = {0, 127, 255}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{73, 180.8}, {73, 178.8}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{65.65, 177}, {70.65, 177}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{72, 235.2}, {72, 237.2}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{63.65, 239}, {69.65, 239}}, color = {0, 0, 127}));
  connect(realValue_T_HX030_out.numberPort, feedback2.y) annotation(
    Line(points = {{149.65, 314}, {155.3, 314}}, color = {0, 0, 127}));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{159.6, 314}, {163.6, 314}}, color = {0, 0, 127}));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{158, 319.8}, {158, 315.8}}, color = {0, 0, 127}));
  connect(realValue_T_HX040_out.numberPort, feedback3.y) annotation(
    Line(points = {{140, 118}, {136, 118}}, color = {0, 0, 127}));
  connect(const3.y, feedback3.u2) annotation(
    Line(points = {{134, 114.2}, {134, 116.2}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_in.numberPort, feedback4.y) annotation(
    Line(points = {{314.35, 187}, {302, 187}}, color = {0, 0, 127}));
  connect(feedback4.u2, const4.y) annotation(
    Line(points = {{300, 185.4}, {300, 183}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_out.numberPort, feedback5.y) annotation(
    Line(points = {{307.35, 285}, {303, 285}}, color = {0, 0, 127}));
  connect(feedback5.u2, const5.y) annotation(
    Line(points = {{301, 286.6}, {301, 289.2}}, color = {0, 0, 127}));
  connect(Q_flow_HX040.port_b, conv_HX040.fluid) annotation(
    Line(points = {{124, 69}, {124, 76}}, color = {191, 0, 0}, thickness = 2));
  connect(T_cold.port, Q_flow_HX040.port_a) annotation(
    Line(points = {{124, 54}, {124, 61}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX040.Q_flow, gain.u) annotation(
    Line(points = {{128.4, 65}, {132.4, 65}}, color = {0, 0, 127}));
  connect(gain.y, realValue_Q_flow_HX040.numberPort) annotation(
    Line(points = {{139.3, 65}, {144.3, 65}}, color = {0, 0, 127}));
  connect(Q_flow_HX020.Q_flow, gain1.u) annotation(
    Line(points = {{182.4, 359}, {186.4, 359}}, color = {0, 0, 127}));
  connect(gain1.y, realValue_Q_flow_HX0401.numberPort) annotation(
    Line(points = {{193.3, 359}, {198.3, 359}}, color = {0, 0, 127}));
  connect(conv_HX020.fluid, Q_flow_HX020.port_a) annotation(
    Line(points = {{178, 348}, {178, 356}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX020.port_b, T_hot.port) annotation(
    Line(points = {{178, 363}, {178, 371}}, color = {191, 0, 0}, thickness = 2));
  connect(rho_HX020_out.port, HX020.ports[2]) annotation(
    Line(points = {{170, 294}, {170, 298}, {188, 298}}, color = {0, 127, 255}));
  connect(rho_HX020_out.d, realValue_rho_HX020_out.numberPort) annotation(
    Line(points = {{174.4, 290}, {178.4, 290}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{280, 101}, {280, 145.4}}, color = {0, 0, 127}));
  connect(s_Valve030_out.port_b, HX040.ports[1]) annotation(
    Line(points = {{84, 161}, {84, 130}, {114, 130}}, color = {0, 127, 255}, thickness = 2));
  connect(product.u1, ramp_Cmp010_PR.y) annotation(
    Line(points = {{320, 238}, {328.5, 238}}, color = {0, 0, 127}));
  connect(ramp_p1.y, product.u2) annotation(
    Line(points = {{280, 101}, {280, 136}, {320, 136}, {320, 234}}, color = {0, 0, 127}));
  connect(s_Valve030_in.port_b, T_Valve030_in.port_a) annotation(
    Line(points = {{84, 246.5}, {84, 242}}, color = {0, 127, 255}, thickness = 2));
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
  connect(HX020.ports[3], s_Valve030_in.port_a) annotation(
    Line(points = {{188, 298}, {84, 298}, {84, 252}}, color = {0, 127, 255}, thickness = 2));
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
    Line(points = {{291.3, 187}, {298.3, 187}}, color = {0, 0, 127}));
  connect(T_Cmp010_in.port_b, rho_Cmp010_in.port_a) annotation(
    Line(points = {{288, 190}, {288, 195}}, color = {0, 127, 255}, thickness = 2));
  connect(realValue_rho_Cmp010_in.numberPort, rho_Cmp010_in.d) annotation(
    Line(points = {{276.2, 198}, {284.2, 198}}, color = {0, 0, 127}));
  connect(realValue_rho_Cmp010_out.numberPort, rho_Cmp010_out.d) annotation(
    Line(points = {{272.2, 272}, {285.2, 272}}, color = {0, 0, 127}));
  connect(rho_Cmp010_out.port_b, T_Cmp010_out.port_a) annotation(
    Line(points = {{288, 275}, {288, 282}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Cmp010_out.T, feedback5.u1) annotation(
    Line(points = {{291.3, 285}, {299.3, 285}}, color = {0, 0, 127}));
  connect(boundary.ports[1], T_Cmp010_in.port_a) annotation(
    Line(points = {{288, 168}, {288, 184}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Cmp010_in.port_b, s_Cmp010_in.port_a) annotation(
    Line(points = {{288, 202}, {288, 210}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Cmp010_out.port_b, rho_Cmp010_out.port_a) annotation(
    Line(points = {{288, 263}, {288, 270}}, color = {0, 127, 255}, thickness = 2));
  connect(Cmp010_in.ports[1], s_Cmp010_in.port_b) annotation(
    Line(points = {{288, 220}, {288, 216}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Cmp010_in.s, inverseBlockConstraints.u1) annotation(
    Line(points = {{285, 213}, {273, 213}, {273, 221}}, color = {0, 0, 127}));
  connect(s_Cmp010_out.port_a, Cmp010_out.ports[1]) annotation(
    Line(points = {{288, 257}, {288, 252}}, color = {0, 127, 255}, thickness = 2));
  connect(product.y, Cmp010_out.p_in) annotation(
    Line(points = {{311, 236}, {292, 236}, {292, 241}}, color = {0, 0, 127}));
  connect(s_Cmp010_out.s, inverseBlockConstraints.u2) annotation(
    Line(points = {{284, 260}, {280, 260}, {280, 223}, {273, 223}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y1, Cmp010_out.h_in) annotation(
    Line(points = {{273, 235}, {290, 235}, {290, 242}}, color = {0, 0, 127}));
  connect(HX020.ports[4], T_Cmp010_out.port_b) annotation(
    Line(points = {{188, 298}, {288, 298}, {288, 288}}, color = {0, 127, 255}, thickness = 2));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 400}, {340, 0}}), graphics = {Text(origin = {61, 168}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {59, 233}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {147, 309}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {159, 113}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {334, 182}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {328, 280}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {165, 59}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {219, 311}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {130, 140}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 186}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 223}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {192, 286}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {268, 268}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {272, 194}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left)}),
    version = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end RefrigCycleMachine_R134_ex03;