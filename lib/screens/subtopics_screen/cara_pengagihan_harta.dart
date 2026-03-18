import 'dart:math' as math;
import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — Bottom Sheet wrapper (consistent dengan definisi_harta_pusaka)
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Cara Pengagihan Harta Si Mati":
//     _openSheet(context, const CaraPengagihanHartaSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class CaraPengagihanHartaSheet extends StatelessWidget {
  const CaraPengagihanHartaSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.93,
      decoration: const BoxDecoration(
        color: Color(0xFFF7F8FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // Drag handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(child: _CaraPengagihanBody()),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MAIN BODY
// ─────────────────────────────────────────────────────────────────────────────
class _CaraPengagihanBody extends StatefulWidget {
  @override
  State<_CaraPengagihanBody> createState() => _CaraPengagihanBodyState();
}

class _CaraPengagihanBodyState extends State<_CaraPengagihanBody>
    with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;

  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);

  // ── Step data ──────────────────────────────────────────────────────────────
  static const List<_StepData> steps = [
    _StepData(
      number: '1',
      title: 'Urusan\nPengebumian',
      icon: Icons.volunteer_activism_rounded,
      color: Color(0xFF1565C0),
      lightColor: Color(0xFFE3F2FD),
      description:
          'Kos pengurusan jenazah si mati dikeluarkan terlebih dahulu daripada hartanya sebelum sebarang pembahagian dilakukan.',
      details: [
        'Memandikan jenazah',
        'Mengkafankan jenazah',
        'Menyembahyangkan jenazah',
        'Mengebumikan jenazah',
      ],
      note: 'Kos ini diambil secara ma\'ruf (berpatutan) — tidak berlebihan.',
    ),
    _StepData(
      number: '2',
      title: 'Selesaikan\nHutang',
      icon: Icons.receipt_long_rounded,
      color: Color(0xFF6A1B9A),
      lightColor: Color(0xFFF3E5F5),
      description:
          'Semua hutang si mati wajib diselesaikan sepenuhnya sebelum harta boleh dibahagikan kepada waris.',
      details: [
        'Hutang kepada Allah — zakat, nazar, kaffarah',
        'Hutang kepada manusia — pinjaman, hutang niaga',
        'Hutang yang ada cagaran (رهن)',
        'Hutang yang tiada cagaran',
      ],
      note:
          'Hutang kepada Allah perlu didahulukan mengikut pendapat sebahagian ulama.',
    ),
    _StepData(
      number: '3',
      title: 'Wasiat',
      icon: Icons.description_rounded,
      color: Color(0xFF2E7D32),
      lightColor: Color(0xFFE8F5E9),
      description:
          'Wasiat si mati dilaksanakan selepas hutang dijelaskan, tertakluk kepada had 1/3 daripada baki harta.',
      details: [
        'Hanya sah untuk bukan waris',
        'Tidak melebihi 1/3 harta selepas tolak hutang & pengebumian',
        'Boleh dibatalkan atau diubah semasa hidup',
        'Wasiat kepada waris — perlu izin waris lain',
      ],
      note: 'Tiada wasiat? Terus ke langkah seterusnya.',
    ),
    _StepData(
      number: '4',
      title: 'Harta\nSepencarian',
      icon: Icons.favorite_rounded,
      color: Color(0xFFBF360C),
      lightColor: Color(0xFFFBE9E7),
      description:
          'Tuntutan harta sepencarian (harta yang dikumpul bersama suami isteri) perlu diselesaikan dahulu.',
      details: [
        'Isteri/suami yang masih hidup boleh menuntut bahagiannya',
        'Biasanya ½ daripada harta yang dikumpul bersama',
        'Perlu dibuktikan sumbangan bersama',
        'Tertakluk kepada undang-undang keluarga Islam negeri',
      ],
      note: 'Harta sepencarian bukan sebahagian daripada harta pusaka.',
    ),
    _StepData(
      number: '5',
      title: 'Faraid',
      icon: Icons.balance_rounded,
      color: Color(0xFFC9A84C),
      lightColor: Color(0xFFFFF8E1),
      description:
          'Baki harta selepas semua potongan di atas dibahagikan kepada waris yang layak mengikut hukum faraid.',
      details: [
        'Dibahagikan mengikut Al-Quran, Hadis & Ijmak',
        'Kadar bahagian ditentukan oleh hubungan waris',
        'Waris lelaki — Asabah (waris sisa)',
        'Waris perempuan — Ashab al-Furud (bahagian tetap)',
      ],
      note: 'Inilah tujuan utama ilmu faraid dipelajari.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  void _onStepTap(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = null;
        _animCtrl.reverse();
      } else {
        _selectedIndex = index;
        _animCtrl.forward(from: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        children: [
          // ── Hero header ──
          _buildHeader(),
          const SizedBox(height: 20),

          // ── Cycle diagram ──
          _CycleDiagram(
            steps: steps,
            selectedIndex: _selectedIndex,
            onTap: _onStepTap,
          ),

          const SizedBox(height: 24),

          // ── Tap hint ──
          if (_selectedIndex == null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.touch_app_rounded,
                    size: 16, color: Colors.grey.shade400),
                const SizedBox(width: 6),
                Text(
                  'Tap mana-mana langkah untuk lihat huraian',
                  style:
                      TextStyle(color: Colors.grey.shade400, fontSize: 12.5),
                ),
              ],
            ),

          // ── Detail card (animated) ──
          if (_selectedIndex != null) ...[
            FadeTransition(
              opacity: _fadeAnim,
              child: _DetailCard(step: steps[_selectedIndex!]),
            ),
          ],

          const SizedBox(height: 20),

          // ── Sequence strip (step pills) ──
          _SequenceStrip(steps: steps, selectedIndex: _selectedIndex),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D1247), Color(0xFF2E3192)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: royalBlue.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.account_tree_rounded,
                color: Colors.white, size: 26),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cara Pengagihan Harta Si Mati',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '5 langkah mengikut tertib yang betul',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CYCLE DIAGRAM  (CustomPainter)
// ─────────────────────────────────────────────────────────────────────────────
class _CycleDiagram extends StatelessWidget {
  final List<_StepData> steps;
  final int? selectedIndex;
  final ValueChanged<int> onTap;

  const _CycleDiagram({
    required this.steps,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth;
          final center = Offset(size / 2, size / 2);
          final orbitRadius = size * 0.355;
          final nodeRadius = size * 0.115;

          // Compute node positions (start top, clockwise)
          final positions = List.generate(steps.length, (i) {
            final angle = -math.pi / 2 + (2 * math.pi / steps.length) * i;
            return Offset(
              center.dx + orbitRadius * math.cos(angle),
              center.dy + orbitRadius * math.sin(angle),
            );
          });

          return GestureDetector(
            onTapUp: (details) {
              for (int i = 0; i < positions.length; i++) {
                final dx = details.localPosition.dx - positions[i].dx;
                final dy = details.localPosition.dy - positions[i].dy;
                if (math.sqrt(dx * dx + dy * dy) <= nodeRadius * 1.3) {
                  onTap(i);
                  return;
                }
              }
            },
            child: CustomPaint(
              painter: _CyclePainter(
                steps: steps,
                positions: positions,
                center: center,
                orbitRadius: orbitRadius,
                nodeRadius: nodeRadius,
                selectedIndex: selectedIndex,
              ),
              size: Size(size, size),
            ),
          );
        },
      ),
    );
  }
}

class _CyclePainter extends CustomPainter {
  final List<_StepData> steps;
  final List<Offset> positions;
  final Offset center;
  final double orbitRadius;
  final double nodeRadius;
  final int? selectedIndex;

  _CyclePainter({
    required this.steps,
    required this.positions,
    required this.center,
    required this.orbitRadius,
    required this.nodeRadius,
    required this.selectedIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // ── 1. Orbit ring ──
    final orbitPaint = Paint()
      ..color = const Color(0xFF2E3192).withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, orbitRadius, orbitPaint);

    // ── 2. Arrow arcs between nodes ──
    for (int i = 0; i < steps.length; i++) {
      final next = (i + 1) % steps.length;
      _drawArrowArc(canvas, positions[i], positions[next], nodeRadius,
          steps[i].color);
    }

    // ── 3. Centre circle ──
    final centerPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0D1247), Color(0xFF2E3192)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: center, radius: orbitRadius * 0.38));
    canvas.drawCircle(center, orbitRadius * 0.38, centerPaint);

    // Centre text
    _drawCentreText(canvas, center, orbitRadius * 0.38);

    // ── 4. Node circles ──
    for (int i = 0; i < steps.length; i++) {
      _drawNode(canvas, i);
    }
  }

  void _drawArrowArc(Canvas canvas, Offset from, Offset to, double r, Color c) {
    final fromAngle = math.atan2(to.dy - from.dy, to.dx - from.dx);
    final toAngle = math.atan2(from.dy - to.dy, from.dx - to.dx);
    final startPt =
        from + Offset(math.cos(fromAngle) * r, math.sin(fromAngle) * r);
    final endPt =
        to + Offset(math.cos(toAngle) * r, math.sin(toAngle) * r);

    final paint = Paint()
      ..color = c.withOpacity(0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(startPt.dx, startPt.dy);

    // Slight curve via midpoint offset
    final mid = (startPt + endPt) / 2;
    final perp = Offset(-(endPt.dy - startPt.dy), endPt.dx - startPt.dx);
    final len = math.sqrt(perp.dx * perp.dx + perp.dy * perp.dy);
    final ctrl = mid + Offset(perp.dx / len, perp.dy / len) * 12;

    path.quadraticBezierTo(ctrl.dx, ctrl.dy, endPt.dx, endPt.dy);
    canvas.drawPath(path, paint);

    // Arrowhead
    final arrowAngle = math.atan2(endPt.dy - ctrl.dy, endPt.dx - ctrl.dx);
    const arrowLen = 10.0;
    const arrowAngleDelta = 0.45;
    final arrowPt1 = Offset(
      endPt.dx - arrowLen * math.cos(arrowAngle - arrowAngleDelta),
      endPt.dy - arrowLen * math.sin(arrowAngle - arrowAngleDelta),
    );
    final arrowPt2 = Offset(
      endPt.dx - arrowLen * math.cos(arrowAngle + arrowAngleDelta),
      endPt.dy - arrowLen * math.sin(arrowAngle + arrowAngleDelta),
    );
    final arrowPaint = Paint()
      ..color = c.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    final arrowPath = Path()
      ..moveTo(endPt.dx, endPt.dy)
      ..lineTo(arrowPt1.dx, arrowPt1.dy)
      ..lineTo(arrowPt2.dx, arrowPt2.dy)
      ..close();
    canvas.drawPath(arrowPath, arrowPaint);
  }

  void _drawNode(Canvas canvas, int i) {
    final pos = positions[i];
    final step = steps[i];
    final isSelected = selectedIndex == i;
    final r = isSelected ? nodeRadius * 1.12 : nodeRadius;

    // Glow for selected
    if (isSelected) {
      final glowPaint = Paint()
        ..color = step.color.withOpacity(0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
      canvas.drawCircle(pos, r * 1.3, glowPaint);
    }

    // Shadow
    final shadowPaint = Paint()
      ..color = step.color.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(pos, r, shadowPaint);

    // Fill
    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [step.color, step.color.withOpacity(0.75)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: pos, radius: r));
    canvas.drawCircle(pos, r, fillPaint);

    // Border
    final borderPaint = Paint()
      ..color = isSelected ? Colors.white : Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 2.5 : 1.5;
    canvas.drawCircle(pos, r, borderPaint);

    // Number label
    final numPainter = TextPainter(
      text: TextSpan(
        text: step.number,
        style: TextStyle(
          color: Colors.white,
          fontSize: r * 0.52,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();
    numPainter.paint(
      canvas,
      Offset(pos.dx - numPainter.width / 2, pos.dy - r * 0.65),
    );

    // Title label (multiline)
    final titlePainter = TextPainter(
      text: TextSpan(
        text: step.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: r * 0.32,
          fontWeight: FontWeight.w600,
          height: 1.25,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      maxLines: 3,
    )..layout(maxWidth: r * 1.7);
    titlePainter.paint(
      canvas,
      Offset(
        pos.dx - titlePainter.width / 2,
        pos.dy - r * 0.08,
      ),
    );
  }

  void _drawCentreText(Canvas canvas, Offset center, double r) {
    // Icon-ish symbol
    final line1 = TextPainter(
      text: const TextSpan(
        text: 'Cara',
        style: TextStyle(
          color: Color(0xFFEDD98A),
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: r * 1.7);

    final line2 = TextPainter(
      text: const TextSpan(
        text: 'Pengagihan',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: r * 1.7);

    final line3 = TextPainter(
      text: const TextSpan(
        text: 'Harta',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: r * 1.7);

    final totalH = line1.height + line2.height + line3.height + 6;
    var y = center.dy - totalH / 2;

    line1.paint(canvas, Offset(center.dx - line1.width / 2, y));
    y += line1.height + 2;
    line2.paint(canvas, Offset(center.dx - line2.width / 2, y));
    y += line2.height + 2;
    line3.paint(canvas, Offset(center.dx - line3.width / 2, y));
  }

  @override
  bool shouldRepaint(_CyclePainter old) =>
      old.selectedIndex != selectedIndex;
}

// ─────────────────────────────────────────────────────────────────────────────
// DETAIL CARD — shown when step is tapped
// ─────────────────────────────────────────────────────────────────────────────
class _DetailCard extends StatelessWidget {
  final _StepData step;
  const _DetailCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: step.color.withOpacity(0.18),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: step.color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(step.icon, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Langkah ${step.number} — ${step.title.replaceAll('\n', ' ')}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 3.5,
                      height: 60,
                      decoration: BoxDecoration(
                        color: step.color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        step.description,
                        style: const TextStyle(
                          fontSize: 13.5,
                          height: 1.6,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),
                Divider(color: Colors.grey.shade100, height: 1),
                const SizedBox(height: 14),

                // Details list
                Text(
                  'Termasuk:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: step.color,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 8),
                ...step.details.map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: step.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              d,
                              style: const TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: Color(0xFF444444),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),

                // Note
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: step.lightColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.lightbulb_rounded,
                          color: step.color, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          step.note,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: step.color.withOpacity(0.9),
                            height: 1.4,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SEQUENCE STRIP — horizontal scrollable step pills
// ─────────────────────────────────────────────────────────────────────────────
class _SequenceStrip extends StatelessWidget {
  final List<_StepData> steps;
  final int? selectedIndex;

  const _SequenceStrip({required this.steps, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'Tertib Pengagihan',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(steps.length, (i) {
              final step = steps[i];
              final isActive = selectedIndex == i;
              return Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isActive ? step.color : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            isActive ? step.color : Colors.grey.shade200,
                      ),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: step.color.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              )
                            ]
                          : [],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          step.icon,
                          size: 14,
                          color: isActive
                              ? Colors.white
                              : step.color,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          step.title.replaceAll('\n', ' '),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isActive
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (i < steps.length - 1)
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: Colors.grey.shade300,
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────────────────────────────────────
class _StepData {
  final String number;
  final String title;
  final IconData icon;
  final Color color;
  final Color lightColor;
  final String description;
  final List<String> details;
  final String note;

  const _StepData({
    required this.number,
    required this.title,
    required this.icon,
    required this.color,
    required this.lightColor,
    required this.description,
    required this.details,
    required this.note,
  });
}