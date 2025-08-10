// Custom UI enhancements for StepDaddyLive integration
console.log('Home Hub custom UI loaded');

// Enhanced iframe integration for streaming
window.addEventListener('DOMContentLoaded', function() {
    // Add custom styles for streaming integration
    const style = document.createElement('style');
    style.textContent = `
        .streaming-panel iframe {
            border: 2px solid #ff4757;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(255, 71, 87, 0.3);
        }
        .sports-button {
            background: linear-gradient(135deg, #ff4757, #ff3742)!important;
            color: white!important;
        }
        .live-indicator {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% { opacity: 1; }
            50% { opacity: 0.5; }
            100% { opacity: 1; }
        }
    `;
    document.head.appendChild(style);
});

// Custom streaming service integration
class StreamingService {
    constructor() {
        this.channels = ['espn', 'fox', 'nbc', 'tnt', 'tennis', 'euro'];
        this.baseUrl = '/step/api/stream/';
    }
    
    openChannel(channel) {
        const url = this.baseUrl + channel;
        window.open(url, '_blank', 'width=1280,height=720,scrollbars=no,resizable=yes');
    }
    
    embedChannel(channel, container) {
        const iframe = document.createElement('iframe');
        iframe.src = this.baseUrl + channel;
        iframe.style.width = '100%';
        iframe.style.height = '500px';
        iframe.style.border = 'none';
        iframe.allowFullscreen = true;
        container.appendChild(iframe);
    }
}

// Make streaming service globally available
window.streamingService = new StreamingService();