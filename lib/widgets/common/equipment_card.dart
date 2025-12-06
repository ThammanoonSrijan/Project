import 'package:flutter/material.dart';

class EquipmentCard extends StatelessWidget {
  final String title;
  final Widget child;

  // สามารถย่อ/ขยายการ์ดได้ไหม
  final bool collapsible;
  final bool collapsed;
  final VoidCallback? onToggleCollapse;

  // สามารถเปิด–ปิดการนับในการคำนวณได้ไหม
  final bool canToggleEnable;
  final bool enabled;
  final ValueChanged<bool>? onToggleEnable;

  const EquipmentCard({
    super.key,
    required this.title,
    required this.child,
    this.collapsible = false,
    this.collapsed = false,
    this.onToggleCollapse,
    this.canToggleEnable = false,
    this.enabled = true,
    this.onToggleEnable,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: enabled
              ? Colors.cyanAccent.withOpacity(0.3)
              : Colors.grey.withOpacity(0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header แสดง title + toggle ต่าง ๆ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: enabled ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                if (canToggleEnable)
                  Row(
                    children: <Widget>[
                      const Text(
                        "Include",
                        style: TextStyle(fontSize: 12),
                      ),
                      Switch(
                        value: enabled,
                        onChanged: onToggleEnable,
                      ),
                    ],
                  ),
                if (collapsible)
                  IconButton(
                    onPressed: onToggleCollapse,
                    icon: Icon(
                      collapsed
                          ? Icons.expand_more
                          : Icons.expand_less,
                    ),
                  ),
              ],
            ),
          ),
          if (!collapsed)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: child,
            ),
        ],
      ),
    );
  }
}
